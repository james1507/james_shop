import 'package:james_shop/core/utils/constant/local_storage_constants.dart';
import 'package:james_shop/shared/domain/enum/language_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  final SharedPreferences _preferences;

  AppSharedPrefs(this._preferences);

  LanguageEnum? getLang() {
    String? data = _preferences.getString(LocalStorageConstants.lang);
    if(data == null) {
      return LanguageEnum.en;
    }

    return LanguageEnum.values.firstWhere((element) => element.local == data);
  }

  Future<void> setLang(LanguageEnum language) async {
    await _preferences.setString(LocalStorageConstants.lang, language.local);
  }

  bool getIsDarkTheme() {
    return _preferences.getBool(LocalStorageConstants.theme) ?? false;
  }

  void setDarkTheme(bool isDark) {
    _preferences.setBool(LocalStorageConstants.theme, isDark);
  }
}