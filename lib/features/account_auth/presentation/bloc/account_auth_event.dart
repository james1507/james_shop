part of 'account_auth_bloc.dart';

abstract class AccountAuthEvent {
  const AccountAuthEvent();
}

class NavigateToLoginEvent extends AccountAuthEvent {}