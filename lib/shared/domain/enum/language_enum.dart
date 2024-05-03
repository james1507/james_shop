import 'package:james_shop/core/translations/l10n.dart';

enum LanguageEnum {
  en,
  vi,
}

extension LanguageEnumExtension on LanguageEnum {
  String get local {
    switch (this) {
      case LanguageEnum.en:
        return "en";

      case LanguageEnum.vi:
        return "vi";

      default:
        return "en";
    }
  }

  String get localHeader {
    switch (this) {
      case LanguageEnum.en:
        return "en-US";

      case LanguageEnum.vi:
        return "vi-VN";

      default:
        return "en-US";
    }
  }

  String get name {
    switch (this) {
      case LanguageEnum.en:
        return lang.english;

      case LanguageEnum.vi:
        return lang.vietnamese;

      default:
        return lang.english;
    }
  }
}

