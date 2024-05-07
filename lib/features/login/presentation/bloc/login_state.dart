part of 'login_bloc.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String error;

  const LoginError({required this.error});
}

class LoginSuccess extends LoginState {
  final LoginResponse response;

  const LoginSuccess({required this.response});
}

class EmailFocusedState extends LoginState {}

class PasswordFocusedState extends LoginState {}

class RememberMeState extends LoginState {}
