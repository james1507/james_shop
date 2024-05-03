import 'package:flutter/material.dart';
import 'package:james_shop/core/flavors/app.dart';
import 'package:james_shop/core/translations/intl/app_localizations.dart';

S get lang {
  return S.of(navigatorKey.currentContext!)!;
}

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('vi'),
  ];
}
