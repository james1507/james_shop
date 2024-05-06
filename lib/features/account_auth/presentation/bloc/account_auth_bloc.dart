import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:james_shop/core/flavors/app.dart';
import 'package:james_shop/core/router/app_route_enum.dart';

part 'account_auth_event.dart';
part 'account_auth_state.dart';

class AccountAuthBloc extends Bloc<AccountAuthEvent, AccountAuthState> {
  AccountAuthBloc() : super(AccountAuthInitialState()) {
    on<NavigateToLoginEvent>(_onNavigateToLogin);
  }

  _onNavigateToLogin(
      NavigateToLoginEvent event, Emitter<AccountAuthState> emitter) {
    Navigator.of(navigatorKey.currentContext!).pushNamed(
      AppRouteEnum.loginPage.name,
    );
  }
}
