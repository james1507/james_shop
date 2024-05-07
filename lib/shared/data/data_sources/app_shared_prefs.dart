import 'dart:convert';

import 'package:james_shop/core/utils/constant/local_storage_constants.dart';
import 'package:james_shop/shared/domain/entities/user_entity.dart';
import 'package:james_shop/shared/domain/enum/language_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  final SharedPreferences _preferences;

  AppSharedPrefs(this._preferences);

  LanguageEnum? getLang() {
    String? data = _preferences.getString(LocalStorageConstants.lang);
    if (data == null) {
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

  UserEntity? getUser() {
    final user = _preferences.getString(LocalStorageConstants.user);
    if (user == null) return null;

    return UserEntity.fromJson(json.decode(user));
  }

  void setUser(UserEntity? user) {
    if (user == null) {
      _preferences.remove(LocalStorageConstants.user);
    } else {
      _preferences.setString(
          LocalStorageConstants.user, json.encode(user.toJson()));
    }
  }

  bool isFirstRun() {
    return _preferences.getBool(LocalStorageConstants.isFirstRun) ?? true;
  }

  void setFirstRun(bool? isFirstRun) {
    if (isFirstRun == null) {
      _preferences.remove(LocalStorageConstants.isFirstRun);
    } else {
      _preferences.setBool(LocalStorageConstants.isFirstRun, isFirstRun);
    }
  }
}
