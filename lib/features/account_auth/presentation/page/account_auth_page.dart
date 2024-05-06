import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:james_shop/core/translations/l10n.dart';
import 'package:james_shop/core/utils/constant/app_assets.dart';
import 'package:james_shop/shared/domain/enum/social_enum.dart';
import 'package:james_shop/shared/presentation/widgets/app_button.dart';

class AccountAuthPage extends StatefulWidget {
  const AccountAuthPage({super.key});

  @override
  State<AccountAuthPage> createState() => _AccountAuthPageState();
}

class _AccountAuthPageState extends State<AccountAuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imageAndTitle(),
          _socials(),
          _or(),
          _signInWithPassword(),
          _signUp(),
        ],
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
        return AppButton(
          buttonColor: theme.colorScheme.onBackground,
          overlayColor: theme.primaryColor.withOpacity(0.1),
          padding: const EdgeInsets.all(17),
          border: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: theme.primaryColor.withOpacity(0.1),
              strokeAlign: 0.5,
            ),
          ),
          onPressed: () {},
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
      padding: const EdgeInsets.all(17),
      onPressed: () {},
      child: Text(
        lang.signInWithPassword,
        style: theme.textTheme.titleMedium!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onBackground,
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
            onPressed: () {},
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
}