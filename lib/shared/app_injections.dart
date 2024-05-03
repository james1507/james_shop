import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/shared/data/data_sources/app_shared_prefs.dart';

initAppInjections() {
  sl.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(sl()));
}
