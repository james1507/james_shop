part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressedEvent extends LoginEvent {
  final bool loading;
  final AuthBody body;

  const LoginButtonPressedEvent({
    required this.loading,
    required this.body,
  });
}

class SoicalLoginButtonPressedEvent extends LoginEvent {
  final bool loading;
  final AuthBody body;

  const SoicalLoginButtonPressedEvent({
    required this.loading,
    required this.body,
  });
}

class NavigateToRegisterEvent extends LoginEvent {}

class RequestFocusedEvent extends LoginEvent {}

class EmailFocusedEvent extends LoginEvent {}

class PasswordFocusedEvent extends LoginEvent {}

class RememberMeEvent extends LoginEvent {
  final bool rememberMe;
  const RememberMeEvent({required this.rememberMe});
}
