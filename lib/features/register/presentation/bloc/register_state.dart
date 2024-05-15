part of 'register_bloc.dart';

abstract class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterError extends RegisterState {
  final String error;

  const RegisterError({required this.error});
}

class RegisterSuccess extends RegisterState {
  final AuthResponse response;

  const RegisterSuccess({required this.response});
}

class EmailFocusedState extends RegisterState {}

class PasswordFocusedState extends RegisterState {}

class RememberMeState extends RegisterState {}
