import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_auth_event.dart';
part 'account_auth_state.dart';

class AccountAuthBloc extends Bloc<AccountAuthEvent, AccountAuthState> {
  AccountAuthBloc() : super(AccountAuthInitialState());
}
