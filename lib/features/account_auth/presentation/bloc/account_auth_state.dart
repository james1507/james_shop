part of 'account_auth_bloc.dart';

abstract class AccountAuthState {
  const AccountAuthState();
}
class AccountAuthInitialState extends AccountAuthState {}

class AccountAuthLoading extends AccountAuthState {}

class AccountAuthError extends AccountAuthState {
  final String error;

  const AccountAuthError({required this.error});
}

class AccountAuthSuccess extends AccountAuthState {
  final LoginResponse response;

  const AccountAuthSuccess({required this.response});
}