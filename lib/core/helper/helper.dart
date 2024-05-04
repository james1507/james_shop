import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:james_shop/core/utils/constant/app_constants.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/shared/data/data_sources/app_shared_prefs.dart';
import 'package:james_shop/shared/domain/enum/language_enum.dart';


class Helper {
  /// Get language
  static LanguageEnum getLang() {
    LanguageEnum? lang;
    lang = sl<AppSharedPrefs>().getLang();
    lang = lang ?? LanguageEnum.en;
    return lang;
  }

  /// Get svg picture path
  static String getSvgPath(String name) {
    return "$svgPath$name";
  }

  /// Get image picture path
  static String getImagePath(String name) {
    return "$imagePath$name";
  }

  /// Get vertical space
  static double getVerticalSpace() {
    return 10.h;
  }

  /// Get horizontal space
  static double getHorizontalSpace() {
    return 10.w;
  }

  /// Get Dio Header
  static Map<String, dynamic> getHeaders() {
    return {}..removeWhere((key, value) => value == null);
  }

  static bool isDarkTheme() {
    return sl<AppSharedPrefs>().getIsDarkTheme();
  }
}