import 'package:james_shop/core/network/dio_network.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/features/account_auth/data/data_sources/abstract_account_auth_api.dart';
import 'package:james_shop/features/account_auth/data/data_sources/account_auth_repo_api.dart';
import 'package:james_shop/features/account_auth/data/repositories/account_auth_repo_impl.dart';
import 'package:james_shop/features/account_auth/domain/repositories/abstract_account_auth_repository.dart';
import 'package:james_shop/features/account_auth/domain/usecases/social_login_usecase.dart';

initAccountAuthInjection() {
  sl.registerSingleton<AbstractAccountAuthApi>(
      AccountAuthRepositoryApi(DioNetwork.dio));
  sl.registerSingleton<AbstractAccountAuthRepository>(
      AccountAuthRepositoryImpl(sl()));
  sl.registerSingleton<SocialLoginUseCase>(SocialLoginUseCase(sl()));
}
