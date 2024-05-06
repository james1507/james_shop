import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:james_shop/core/flavors/app.dart';
import 'package:james_shop/core/router/app_route_enum.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SplashLoadAndNavigatedEvent>(_onLoadAndNavigate);
  }

  _onLoadAndNavigate(SplashEvent event, Emitter<SplashState> emitter) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
        AppRouteEnum.welcomePage.name,
        (route) => false,
      );
    });
  }
}
