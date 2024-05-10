import 'package:james_shop/core/network/dio_network.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/features/login/data/data_sources/abstract_login_api.dart';
import 'package:james_shop/features/login/data/data_sources/login_repo_api.dart';
import 'package:james_shop/features/login/data/repositories/login_repo_impl.dart';
import 'package:james_shop/features/login/domain/repositories/abstract_login_repository.dart';
import 'package:james_shop/features/login/domain/usecases/login_usecase.dart';
import 'package:james_shop/features/login/domain/usecases/social_login_usecase.dart';

initLoginInjection() {
  sl.registerSingleton<AbstractLoginApi>(LoginRepositoryApi(DioNetwork.dio));
  sl.registerSingleton<AbstractLoginRepository>(LoginRepositoryImpl(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<SocialLoginUseCase>(SocialLoginUseCase(sl()));
}
