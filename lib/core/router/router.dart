import 'package:flutter/material.dart';
import 'package:james_shop/features/account_auth/presentation/page/account_auth_page.dart';
import 'package:james_shop/features/home/presentation/page/home_page.dart';
import 'package:james_shop/features/login/presentation/pages/login_page.dart';
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

      case '/home_page':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) {
            return const HomePage();
          },
        );

      case '/account_auth_page':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) {
            return const AccountAuthPage();
          },
        );

      case '/login_page':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) {
            return const LoginPage();
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
