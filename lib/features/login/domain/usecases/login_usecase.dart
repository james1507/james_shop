import 'package:dio/dio.dart';
import 'package:james_shop/features/login/domain/repositories/abstract_login_repository.dart';
import 'package:james_shop/shared/domain/entities/auth_body.dart';
import 'package:james_shop/shared/domain/entities/auth_response.dart';

class LoginUseCase {
  final AbstractLoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<AuthResponse?> execute(AuthBody? body) async {
    try {
      final response = await _loginRepository.login(body);

      return response;
    } on DioException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
