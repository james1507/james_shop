import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:james_shop/core/flavors/app.dart';
import 'package:james_shop/core/router/app_route_enum.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/features/account_auth/domain/usecases/social_login_usecase.dart';
import 'package:james_shop/features/login/domain/models/login_response.dart';
import 'package:james_shop/features/login/domain/models/login_social_body.dart';
import 'package:james_shop/shared/data/data_sources/app_shared_prefs.dart';
import 'package:james_shop/shared/data/repositories/abstract_social_auth.dart';
import 'package:james_shop/shared/domain/entities/user_entity.dart';
import 'package:james_shop/shared/domain/enum/social_enum.dart';

part 'account_auth_event.dart';
part 'account_auth_state.dart';

class AccountAuthBloc extends Bloc<AccountAuthEvent, AccountAuthState> {
  final SocialLoginUseCase socialLoginUseCase = sl<SocialLoginUseCase>();
  final AbstractSocialAuth socialAuthRepository = sl<AbstractSocialAuth>();
  String error = "";

  AccountAuthBloc() : super(AccountAuthInitialState()) {
    on<NavigateToLoginEvent>(_onNavigateToLogin);
    on<SoicalLoginButtonPressedEvent>(_onSoicalLoginButtonPressed);
  }

  _onNavigateToLogin(
      NavigateToLoginEvent event, Emitter<AccountAuthState> emitter) {
    Navigator.of(navigatorKey.currentContext!).pushNamed(
      AppRouteEnum.loginPage.name,
    );
  }

  _onSoicalLoginButtonPressed(SoicalLoginButtonPressedEvent event,
      Emitter<AccountAuthState> emitter) async {
    if (event.loading) {
      emitter(AccountAuthLoading());
    }

    LoginSocialBody? loginBody;

    if (event.body.socialType == SocialEnum.facebook) {
      loginBody = await socialAuthRepository.signInWithFacebook();
    } else {
      loginBody = await socialAuthRepository.signInWithGoogle();
    }

    final result = await socialLoginUseCase.execute(loginBody);

    if (result != null && result.user != null) {
      emitter(AccountAuthSuccess(response: result));
      UserEntity? user = result.user;
      user = user?.copyWith(rememberMe: true);
      sl<AppSharedPrefs>().setUser(user);
      Navigator.of(navigatorKey.currentContext!)
          .pushNamed(AppRouteEnum.homePage.name);
    } else if (result != null && result.user == null) {
      emitter(const AccountAuthError(error: 'An error occurred'));
      error = result.message ?? 'An error occurred';
    } else {
      emitter(const AccountAuthError(error: 'An error occurred'));
      error = 'An error occurred';
    }
  }
}
