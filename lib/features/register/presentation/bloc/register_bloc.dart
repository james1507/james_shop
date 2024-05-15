import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:james_shop/core/flavors/app.dart';
import 'package:james_shop/core/router/app_route_enum.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/features/login/presentation/pages/login_page.dart';
import 'package:james_shop/features/register/domain/usecases/register_usecase.dart';
import 'package:james_shop/features/register/domain/usecases/social_login_usecase.dart';
import 'package:james_shop/shared/data/data_sources/app_shared_prefs.dart';
import 'package:james_shop/shared/data/repositories/abstract_social_auth.dart';
import 'package:james_shop/shared/domain/entities/auth_body.dart';
import 'package:james_shop/shared/domain/entities/auth_response.dart';
import 'package:james_shop/shared/domain/entities/user_entity.dart';
import 'package:james_shop/shared/domain/enum/social_enum.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase = sl<RegisterUseCase>();
  final SocialLoginUseCase socialRegisterUseCase = sl<SocialLoginUseCase>();
  final AbstractSocialAuth socialAuthRepository = sl<AbstractSocialAuth>();
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  bool rememberMe = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  String error = "";

  RegisterBloc() : super(RegisterInitial()) {
    on<NavigateToLoginEvent>(_onNavigateToLogin);
    on<RegisterButtonPressedEvent>(_onRegisterButtonPressed);
    on<SoicalLoginButtonPressedEvent>(_onSoicalLoginButtonPressed);
    on<RequestFocusedEvent>(_onRequestFocused);
    on<EmailFocusedEvent>(_onEmailFocused);
    on<PasswordFocusedEvent>(_onPasswordFocused);
    on<RememberMeEvent>(_onRememberMe);
  }

  _onNavigateToLogin(
      NavigateToLoginEvent event, Emitter<RegisterState> emitter) {
    Navigator.pushNamedAndRemoveUntil(
      navigatorKey.currentContext!,
      AppRouteEnum.loginPage.name,
      ModalRoute.withName(AppRouteEnum.accountAuthPage.name),
    );
  }

  _onRegisterButtonPressed(
      RegisterButtonPressedEvent event, Emitter<RegisterState> emitter) async {
    if (event.loading) {
      emitter(RegisterLoading());
    }

    AuthBody body = AuthBody(
      email: event.body?.email,
      password: event.body?.password,
      role: 'User',
    );

    final result = await registerUseCase.execute(body);

    if (result != null && result.user != null) {
      emitter(RegisterSuccess(response: result));
      UserEntity? user = result.user;
      user = user?.copyWith(rememberMe: true);
      sl<AppSharedPrefs>().setUser(user);
      Navigator.of(navigatorKey.currentContext!)
          .pushNamed(AppRouteEnum.homePage.name);
    } else if (result != null && result.user == null) {
      emitter(const RegisterError(error: 'An error occurred'));
      error = result.message ?? 'An error occurred';
    } else {
      emitter(const RegisterError(error: 'An error occurred'));
      error = 'An error occurred';
    }
  }

  _onSoicalLoginButtonPressed(SoicalLoginButtonPressedEvent event,
      Emitter<RegisterState> emitter) async {
    if (event.loading) {
      emitter(RegisterLoading());
    }

    AuthBody? loginBody;

    if (event.body?.socialType == SocialEnum.facebook) {
      loginBody = await socialAuthRepository.signInWithFacebook();
    } else {
      loginBody = await socialAuthRepository.signInWithGoogle();
    }

    final result = await socialRegisterUseCase.execute(loginBody);

    if (result != null && result.user != null) {
      emitter(RegisterSuccess(response: result));
      UserEntity? user = result.user;
      user = user?.copyWith(rememberMe: true);
      sl<AppSharedPrefs>().setUser(user);
      Navigator.of(navigatorKey.currentContext!)
          .pushNamed(AppRouteEnum.homePage.name);
    } else if (result != null && result.user == null) {
      emitter(const RegisterError(error: 'An error occurred'));
      error = result.message ?? 'An error occurred';
    } else {
      emitter(const RegisterError(error: 'An error occurred'));
      error = 'An error occurred';
    }
  }

  _onRequestFocused(RequestFocusedEvent event, Emitter<RegisterState> emitter) {
    emailFocusNode.unfocus();
    passwordFocusNode.requestFocus();
  }

  _onEmailFocused(EmailFocusedEvent event, Emitter<RegisterState> emitter) {
    emitter(EmailFocusedState());
    emailFocusNode.requestFocus();
  }

  _onPasswordFocused(
      PasswordFocusedEvent event, Emitter<RegisterState> emitter) {
    emitter(PasswordFocusedState());
    passwordFocusNode.requestFocus();
  }

  _onRememberMe(RememberMeEvent event, Emitter<RegisterState> emitter) {
    emitter(RememberMeState());
    rememberMe = event.rememberMe;
  }
}
