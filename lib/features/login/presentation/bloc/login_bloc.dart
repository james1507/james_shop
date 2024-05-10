import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:james_shop/core/flavors/app.dart';
import 'package:james_shop/core/router/app_route_enum.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/features/login/domain/models/login_body.dart';
import 'package:james_shop/features/login/domain/models/login_response.dart';
import 'package:james_shop/features/login/domain/models/login_social_body.dart';
import 'package:james_shop/features/login/domain/usecases/login_usecase.dart';
import 'package:james_shop/features/login/domain/usecases/social_login_usecase.dart';
import 'package:james_shop/shared/data/data_sources/app_shared_prefs.dart';
import 'package:james_shop/shared/data/repositories/abstract_social_auth.dart';
import 'package:james_shop/shared/domain/entities/user_entity.dart';
import 'package:james_shop/shared/domain/enum/social_enum.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase = sl<LoginUseCase>();
  final SocialLoginUseCase socialLoginUseCase = sl<SocialLoginUseCase>();
  final AbstractSocialAuth socialAuthRepository = sl<AbstractSocialAuth>();
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  bool rememberMe = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  String error = "";

  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressedEvent>(_onLoginButtonPressed);
    on<SoicalLoginButtonPressedEvent>(_onSoicalLoginButtonPressed);
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

  _onSoicalLoginButtonPressed(
      SoicalLoginButtonPressedEvent event, Emitter<LoginState> emitter) async {
    if (event.loading) {
      emitter(LoginLoading());
    }

    LoginSocialBody? loginBody;

    if (event.body.socialType == SocialEnum.facebook) {
      loginBody = await socialAuthRepository.signInWithFacebook();
    } else {
      loginBody = await socialAuthRepository.signInWithGoogle();
    }

    final result = await socialLoginUseCase.execute(loginBody);

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
