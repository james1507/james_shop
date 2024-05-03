enum AppRouteEnum {
  splashPage,
  welcomePage,
  walkthroughPage,
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

      default:
        return "/splash_page";
    }
  }
}
