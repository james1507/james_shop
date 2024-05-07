part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressedEvent extends LoginEvent {
  final bool loading;
  final LoginBody body;

  const LoginButtonPressedEvent({
    required this.loading,
    required this.body,
  });
}

class RequestFocusedEvent extends LoginEvent {}

class EmailFocusedEvent extends LoginEvent {}

class PasswordFocusedEvent extends LoginEvent {}

class RememberMeEvent extends LoginEvent {
  final bool rememberMe;
  const RememberMeEvent({required this.rememberMe});
}
