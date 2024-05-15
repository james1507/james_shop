import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:james_shop/core/translations/l10n.dart';
import 'package:james_shop/features/register/presentation/bloc/register_bloc.dart';
import 'package:james_shop/shared/domain/entities/auth_body.dart';
import 'package:james_shop/shared/domain/enum/social_enum.dart';
import 'package:james_shop/shared/presentation/widgets/app_button.dart';
import 'package:james_shop/shared/presentation/widgets/app_loader.dart';
import 'package:james_shop/shared/presentation/widgets/app_text_input.dart';
import 'package:james_shop/shared/presentation/widgets/auth_appbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _bloc = RegisterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegisterBloc, RegisterState>(
        bloc: _bloc,
        builder: (context, state) {
          return Stack(
            children: [
              AuthAppbar(
                title: lang.registerTitle,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _textInputFields(state),
                      const SizedBox(height: 10),
                      _signUpButton(),
                      const SizedBox(height: 24),
                      _orContinueWith(),
                      _socials(),
                      const SizedBox(height: 24),
                      _signIn(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              if (state is RegisterLoading) const AppLoader()
            ],
          );
        },
      ),
    );
  }

  Widget _textInputFields(RegisterState state) {
    final theme = Theme.of(context);

    return Column(
      children: [
        AppTextInput(
          controller: _bloc.emailInputController,
          hintText: lang.email,
          icon: Icons.email,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusNode: _bloc.emailFocusNode,
          onSubmitted: (value) {
            _bloc.add(RequestFocusedEvent());
          },
          onTap: () {
            _bloc.add(EmailFocusedEvent());
          },
        ),
        const SizedBox(height: 24),
        AppTextInput(
          controller: _bloc.passwordInputController,
          showTogglePassword: true,
          hintText: lang.password,
          icon: Icons.lock,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textInputAction: TextInputAction.done,
          focusNode: _bloc.passwordFocusNode,
          onTap: () {
            _bloc.add(PasswordFocusedEvent());
          },
        ),
        const SizedBox(height: 24),
        if (state is RegisterError)
          Text(
            _bloc.error,
            style: theme.textTheme.titleSmall!.copyWith(
              color: theme.colorScheme.error,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
      ],
    );
  }

  Widget _signUpButton() {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return AppButton(
      height: 60,
      width: size.width,
      buttonColor: theme.primaryColor,
      child: Text(
        lang.signUp,
        style: theme.textTheme.titleMedium!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface,
        ),
      ),
      onPressed: () {
        callLogin();
      },
    );
  }

  Widget _orContinueWith() {
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
            lang.orContinueWith,
            style: theme.textTheme.titleMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: theme.primaryColor.withOpacity(0.7),
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

  Widget _socials() {
    final theme = Theme.of(context);

    return SizedBox(
      height: 60,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          SocialEnum socialEnum = SocialEnum.values[index];

          return AppButton(
            width: 88,
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
                SvgPicture.asset(SocialEnum.values[index].icon),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 20);
        },
        itemCount: SocialEnum.values.length,
      ),
    );
  }

  Widget _signIn() {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          lang.alreadyHaveAnAccount,
          style: theme.textTheme.titleMedium!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: theme.primaryColor.withOpacity(0.7),
          ),
        ),
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll(
              theme.primaryColor.withOpacity(0.1),
            ),
          ),
          onPressed: () {
            _bloc.add(NavigateToLoginEvent());
          },
          child: Text(
            lang.signIn,
            style: theme.textTheme.titleMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  callLogin({bool loading = true}) {
    final AuthBody loginBody = AuthBody(
      email: _bloc.emailInputController.text,
      password: _bloc.passwordInputController.text,
    );

    _bloc.add(
      RegisterButtonPressedEvent(
        body: loginBody,
        loading: loading,
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
