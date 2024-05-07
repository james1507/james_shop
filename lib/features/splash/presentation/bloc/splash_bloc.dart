import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:james_shop/core/flavors/app.dart';
import 'package:james_shop/core/router/app_route_enum.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/shared/data/data_sources/app_shared_prefs.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SplashLoadAndNavigatedEvent>(_onLoadAndNavigate);
  }

  _onLoadAndNavigate(SplashEvent event, Emitter<SplashState> emitter) {
    String routeName = AppRouteEnum.welcomePage.name;
    final user = sl<AppSharedPrefs>().getUser();

    Future.delayed(const Duration(seconds: 3), () {
      if (sl<AppSharedPrefs>().isFirstRun()) {
        routeName = AppRouteEnum.welcomePage.name;
      } else if ((user?.rememberMe ?? false) && user == null) {
        routeName = AppRouteEnum.accountAuthPage.name;
      } else if ((user?.rememberMe ?? false) && user != null) {
        routeName = AppRouteEnum.homePage.name;
      } else if (!(user?.rememberMe ?? false)) {
        sl<AppSharedPrefs>().setUser(null);
        routeName = AppRouteEnum.accountAuthPage.name;
      } else {
        routeName = AppRouteEnum.accountAuthPage.name;
      }

      Navigator.of(navigatorKey.currentContext!)
          .pushNamedAndRemoveUntil(routeName, (route) => false);
    });
  }
}
