enum AppRouteEnum {
  splashPage,
  welcomePage,
  walkthroughPage,
  homePage,
  accountAuthPage,
  loginPage,
  registerPage,
}

extension AppRouteExtension on AppRouteEnum {
  String get name {
    switch (this) {
      case AppRouteEnum.splashPage:
        return "/splash_page";

      case AppRouteEnum.welcomePage:
        return "/welcome_page";

      case AppRouteEnum.walkthroughPage:
        return "/walkthrough_page";

      case AppRouteEnum.homePage:
        return "/home_page";

      case AppRouteEnum.accountAuthPage:
        return "/account_auth_page";

      case AppRouteEnum.loginPage:
        return "/login_page";

      case AppRouteEnum.registerPage:
        return "/register_page";

      default:
        return "/splash_page";
    }
  }
}
