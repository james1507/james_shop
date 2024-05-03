enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  bool get isDev => F.appFlavor == Flavor.dev;
  bool get isProd => F.appFlavor == Flavor.prod;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'James Shop Dev';
      case Flavor.prod:
        return 'James Shop';
      default:
        return 'James Shop';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://www.jamesshopdev.com';
      case Flavor.prod:
        return 'https://www.jamesshop.com';
      default:
        return 'https://www.jamesshop.com';
    }
  }
}
