import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:james_shop/core/flavors/app.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/features/home/presentation/page/home_page.dart';
import 'package:james_shop/features/login/domain/models/login_body.dart';
import 'package:james_shop/features/login/domain/models/login_response.dart';
import 'package:james_shop/features/login/domain/usecases/login_usecase.dart';
import 'package:james_shop/shared/data/data_sources/app_shared_prefs.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    if (event.loading) {
      emit(LoginLoading());
    }

    final result = await loginUseCase.execute(event.body);

    if (result != null) {
      emit(LoginSuccess(response: result));
      sl<AppSharedPrefs>().setUser(result.user);
      Navigator.of(navigatorKey.currentContext!).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      emit(LoginError(error: result?.message ?? 'An error occurred'));
    }
  }
}
