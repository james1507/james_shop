import 'package:dio/dio.dart';
import 'package:james_shop/features/account_auth/data/data_sources/abstract_account_auth_api.dart';
import 'package:james_shop/features/login/domain/models/login_response.dart';
import 'package:james_shop/features/login/domain/models/login_social_body.dart';

class SocialLoginUseCase {
  final AbstractAccountAuthApi _abstractAccountAuthApi;

  SocialLoginUseCase(this._abstractAccountAuthApi);

  Future<LoginResponse?> execute(LoginSocialBody? body) async {
    try {
      final response = await _abstractAccountAuthApi.socialLogin(body);

      return response;
    } on DioException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
