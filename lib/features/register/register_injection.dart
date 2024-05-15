import 'package:james_shop/core/network/dio_network.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/features/register/data/data_sources/abstract_register_api.dart';
import 'package:james_shop/features/register/data/data_sources/register_repo_api.dart';
import 'package:james_shop/features/register/data/repositories/register_repo_impl.dart';
import 'package:james_shop/features/register/domain/repositories/abstract_register_repository.dart';
import 'package:james_shop/features/register/domain/usecases/register_usecase.dart';
import 'package:james_shop/features/register/domain/usecases/social_login_usecase.dart';

initRegisterInjection() {
  sl.registerSingleton<AbstractRegisterApi>(
      RegisterRepositoryApi(DioNetwork.dio));
  sl.registerSingleton<AbstractRegisterRepository>(
      RegisterRepositoryImpl(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  sl.registerSingleton<SocialLoginUseCase>(SocialLoginUseCase(sl()));
}
