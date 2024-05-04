import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:james_shop/core/flavors/app.dart';
import 'package:james_shop/features/onboarding/presentation/page/welcome_page.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SplashLoadAndNavigatedEvent>(_onLoadAndNavigate);
  }

  _onLoadAndNavigate(SplashEvent event, Emitter<SplashState> emitter) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(
        builder: (context) => const WelcomePage(),
      ));
    });
  }
}
