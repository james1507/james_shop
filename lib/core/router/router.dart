import 'package:flutter/material.dart';
import 'package:james_shop/features/splash/presentation/page/splash_page.dart';
import 'package:james_shop/features/onboarding/presentation/page/walkthrough_page.dart';
import 'package:james_shop/features/onboarding/presentation/page/welcome_page.dart';

class AppRouter {
  static String currentRoute = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch (settings.name) {
      case '/splash_page':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const SplashPage(),
        );

      case '/welcome_page':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) {
            return const WelcomePage();
          },
        );

      case '/walkthrough_page':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) {
            return const WalkthroughPage();
          },
        );
      default:
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
