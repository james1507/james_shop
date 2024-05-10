import 'package:dio/dio.dart';
import 'package:james_shop/features/login/domain/models/login_response.dart';
import 'package:james_shop/features/login/domain/models/login_social_body.dart';
import 'package:james_shop/features/login/domain/repositories/abstract_login_repository.dart';

class SocialLoginUseCase {
  final AbstractLoginRepository _loginRepository;

  SocialLoginUseCase(this._loginRepository);

  Future<LoginResponse?> execute(LoginSocialBody? body) async {
    try {
      final response = await _loginRepository.socialLogin(body);

      return response;
    } on DioException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
