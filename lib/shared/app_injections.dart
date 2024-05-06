import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/shared/data/data_sources/app_shared_prefs.dart';
import 'package:james_shop/shared/data/repositories/abstract_social_auth.dart';
import 'package:james_shop/shared/data/repositories/social_auth_repo.dart';

initAppInjections() {
  sl.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(sl()));
  sl.registerFactory<AbstractSocialAuth>(() => SocialAuthRepository());
}
