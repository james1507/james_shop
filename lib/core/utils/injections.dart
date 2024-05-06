import 'package:get_it/get_it.dart';
import 'package:james_shop/core/network/dio_network.dart';
import 'package:james_shop/core/utils/log/app_logger.dart';
import 'package:james_shop/features/login/login_injection.dart';
import 'package:james_shop/shared/app_injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initDioInjections();
  await initAppInjections();
  await initSharedPrefsInjections();
  await initLoginInjection();
}

initSharedPrefsInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();
}

Future<void> initDioInjections() async {
  initRootLogger();
  DioNetwork.initDio();
}
