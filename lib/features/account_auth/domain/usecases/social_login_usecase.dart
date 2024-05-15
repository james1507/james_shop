import 'package:dio/dio.dart';
import 'package:james_shop/features/account_auth/data/data_sources/abstract_account_auth_api.dart';
import 'package:james_shop/shared/domain/entities/auth_body.dart';
import 'package:james_shop/shared/domain/entities/auth_response.dart';

class SocialLoginUseCase {
  final AbstractAccountAuthApi _abstractAccountAuthApi;

  SocialLoginUseCase(this._abstractAccountAuthApi);

  Future<AuthResponse?> execute(AuthBody? body) async {
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
