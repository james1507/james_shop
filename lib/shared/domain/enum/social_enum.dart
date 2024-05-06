import 'package:james_shop/core/translations/l10n.dart';
import 'package:james_shop/core/utils/constant/app_assets.dart';

enum SocialEnum {
  facebook,
  google,
}

extension SocialEnumExtension on SocialEnum {
  String get title {
    switch (this) {
      case SocialEnum.google:
        return lang.continueWithGoogle;
      case SocialEnum.facebook:
        return lang.continueWithFacebook;
      default:
        return lang.continueWithGoogle;
    }
  }

  String get icon {
    switch (this) {
      case SocialEnum.google:
        return AppAssets.google;
      case SocialEnum.facebook:
        return AppAssets.facebook;
      default:
        return AppAssets.google;
    }
  }
}
