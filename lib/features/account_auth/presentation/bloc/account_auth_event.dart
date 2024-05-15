part of 'account_auth_bloc.dart';

abstract class AccountAuthEvent {
  const AccountAuthEvent();
}

class SoicalLoginButtonPressedEvent extends AccountAuthEvent {
  final bool loading;
  final AuthBody body;

  const SoicalLoginButtonPressedEvent({
    required this.loading,
    required this.body,
  });
}

class NavigateToLoginEvent extends AccountAuthEvent {}

class NavigateToRegisterEvent extends AccountAuthEvent {}