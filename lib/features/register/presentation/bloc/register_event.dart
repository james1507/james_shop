part of 'register_bloc.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class RegisterButtonPressedEvent extends RegisterEvent {
  final bool loading;
  final AuthBody? body;

  const RegisterButtonPressedEvent({
    required this.loading,
    required this.body,
  });
}

class SoicalLoginButtonPressedEvent extends RegisterEvent {
  final bool loading;
  final AuthBody? body;

  const SoicalLoginButtonPressedEvent({
    required this.loading,
    required this.body,
  });
}

class NavigateToLoginEvent extends RegisterEvent {}

class RequestFocusedEvent extends RegisterEvent {}

class EmailFocusedEvent extends RegisterEvent {}

class PasswordFocusedEvent extends RegisterEvent {}

class RememberMeEvent extends RegisterEvent {
  final bool rememberMe;
  const RememberMeEvent({required this.rememberMe});
}
