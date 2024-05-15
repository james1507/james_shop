import 'package:dio/dio.dart';
import 'package:james_shop/features/account_auth/domain/repositories/abstract_account_auth_repository.dart';
import 'package:james_shop/features/login/data/data_sources/abstract_login_api.dart';
import 'package:james_shop/features/login/domain/models/login_response.dart';
import 'package:james_shop/features/login/domain/models/login_social_body.dart';

class AccountAuthRepositoryImpl extends AbstractAccountAuthRepository {
  final AbstractLoginApi loginApi;

  AccountAuthRepositoryImpl(this.loginApi);

  @override
  Future<LoginResponse?> socialLogin(LoginSocialBody? body) async {
    try {
      final response = await loginApi.socialLogin(body);

      return response;
    } on DioException catch (e) {
      final errorResponse = LoginResponse.fromJson(e.response);

      return errorResponse;
    } catch (e) {
      return null;
    }
  }
}
