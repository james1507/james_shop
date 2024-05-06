part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final bool loading;
  final LoginBody body;

  const LoginButtonPressed({
    required this.loading,
    required this.body,
  });
}