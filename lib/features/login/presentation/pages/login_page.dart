import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:james_shop/core/style/app_colors.dart';
import 'package:james_shop/core/translations/l10n.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/features/login/domain/usecases/login_usecase.dart';
import 'package:james_shop/features/login/presentation/bloc/login_bloc.dart';
import 'package:james_shop/shared/presentation/widgets/app_text_input.dart';
import 'package:james_shop/shared/presentation/widgets/auth_appbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _bloc = LoginBloc(sl<LoginUseCase>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: BlocBuilder<LoginBloc, LoginState>(
        bloc: _bloc,
        builder: (context, state) {
          return AuthAppbar(
            title: lang.loginTitle,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                children: [
                  AppTextInput(
                    controller: _bloc.emailInputController,
                    hintText: lang.email,
                    icon: const Icon(
                      Icons.email,
                      color: AppColors.greyscale500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppTextInput(
                    controller: _bloc.passwordInputController,
                    showTogglePassword: true,
                    hintText: lang.password,
                    icon: const Icon(
                      Icons.lock,
                      color: AppColors.greyscale500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
