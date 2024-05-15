import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:james_shop/core/translations/l10n.dart';
import 'package:james_shop/core/utils/constant/app_assets.dart';
import 'package:james_shop/features/account_auth/presentation/bloc/account_auth_bloc.dart';
import 'package:james_shop/shared/domain/entities/auth_body.dart';
import 'package:james_shop/shared/domain/enum/social_enum.dart';
import 'package:james_shop/shared/presentation/widgets/app_button.dart';
import 'package:james_shop/shared/presentation/widgets/app_loader.dart';

class AccountAuthPage extends StatefulWidget {
  const AccountAuthPage({super.key});

  @override
  State<AccountAuthPage> createState() => _AccountAuthPageState();
}

class _AccountAuthPageState extends State<AccountAuthPage> {
  final _bloc = AccountAuthBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AccountAuthBloc, AccountAuthState>(
        bloc: _bloc,
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _imageAndTitle(),
                  _socials(),
                  _or(),
                  _signInWithPassword(),
                  _signUp(),
                ],
              ),
              if (state is AccountAuthLoading) const AppLoader()
            ],
          );
        },
      ),
    );
  }

  Widget _imageAndTitle() {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            AppAssets.accountAuth,
          ),
          const SizedBox(height: 16),
          Text(
            lang.letYouIn,
            style: textTheme.displaySmall!.copyWith(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _socials() {
    final theme = Theme.of(context);

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        SocialEnum socialEnum = SocialEnum.values[index];

        return AppButton(
          buttonColor: theme.colorScheme.onBackground,
          overlayColor: theme.colorScheme.secondary.withOpacity(0.1),
          padding: const EdgeInsets.all(17),
          border: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: theme.primaryColor.withOpacity(0.1),
              strokeAlign: 0.5,
            ),
          ),
          onPressed: () {
            callSocialLogin(socialEnum);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                SocialEnum.values[index].icon,
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  SocialEnum.values[index].title,
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.secondary,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemCount: SocialEnum.values.length,
    );
  }

  Widget _or() {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: theme.primaryColor.withOpacity(0.1),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            lang.or,
            style: theme.textTheme.titleMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 1,
              color: theme.primaryColor.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signInWithPassword() {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return AppButton(
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      buttonColor: theme.primaryColor,
      overlayColor: theme.colorScheme.onSurface.withOpacity(0.1),
      padding: const EdgeInsets.all(17),
      onPressed: () {
        _bloc.add(NavigateToLoginEvent());
      },
      child: Text(
        lang.signInWithPassword,
        style: theme.textTheme.titleMedium!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _signUp() {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            lang.dontHaveAnAccount,
            style: theme.textTheme.titleMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: theme.primaryColor.withOpacity(0.5)),
          ),
          const SizedBox(width: 4),
          TextButton(
            style: ButtonStyle(
                padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                overlayColor: MaterialStatePropertyAll(
                    theme.primaryColor.withOpacity(0.1))),
            onPressed: () {
              _bloc.add(NavigateToRegisterEvent());
            },
            child: Text(
              lang.signUp,
              style: theme.textTheme.titleMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: theme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  callSocialLogin(SocialEnum socialEnum, {bool loading = true}) {
    final AuthBody loginBody = AuthBody(socialType: socialEnum);

    _bloc.add(
      SoicalLoginButtonPressedEvent(
        body: loginBody,
        loading: loading,
      ),
    );
  }
}
