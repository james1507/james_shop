import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:james_shop/core/flavors/app.dart';
import 'package:james_shop/core/router/app_route_enum.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/features/login/domain/models/login_body.dart';
import 'package:james_shop/features/login/domain/models/login_response.dart';
import 'package:james_shop/features/login/domain/usecases/login_usecase.dart';
import 'package:james_shop/shared/data/data_sources/app_shared_prefs.dart';
import 'package:james_shop/shared/domain/entities/user_entity.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  bool rememberMe = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  String error = "";

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginButtonPressedEvent>(_onLoginButtonPressed);
    on<RequestFocusedEvent>(_onRequestFocused);
    on<EmailFocusedEvent>(_onEmailFocused);
    on<PasswordFocusedEvent>(_onPasswordFocused);
    on<RememberMeEvent>(_onRememberMe);
  }

  _onLoginButtonPressed(
      LoginButtonPressedEvent event, Emitter<LoginState> emitter) async {
    if (event.loading) {
      emitter(LoginLoading());
    }

    final result = await loginUseCase.execute(event.body);

    if (result != null && result.user != null) {
      emitter(LoginSuccess(response: result));
      UserEntity? user = result.user;
      user = user?.copyWith(rememberMe: rememberMe);
      sl<AppSharedPrefs>().setUser(user);
      Navigator.of(navigatorKey.currentContext!)
          .pushNamed(AppRouteEnum.homePage.name);
    } else if (result != null && result.user == null) {
      emitter(const LoginError(error: 'An error occurred'));
      error = result.message ?? 'An error occurred';
    } else {
      emitter(const LoginError(error: 'An error occurred'));
      error = 'An error occurred';
    }
  }

  _onRequestFocused(RequestFocusedEvent event, Emitter<LoginState> emitter) {
    emailFocusNode.unfocus();
    passwordFocusNode.requestFocus();
  }

  _onEmailFocused(EmailFocusedEvent event, Emitter<LoginState> emitter) {
    emitter(EmailFocusedState());
    emailFocusNode.requestFocus();
  }

  _onPasswordFocused(PasswordFocusedEvent event, Emitter<LoginState> emitter) {
    emitter(PasswordFocusedState());
    passwordFocusNode.requestFocus();
  }

  _onRememberMe(RememberMeEvent event, Emitter<LoginState> emitter) {
    emitter(RememberMeState());
    rememberMe = event.rememberMe;
  }
}
