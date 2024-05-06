import 'package:dio/dio.dart';
import 'package:james_shop/features/login/domain/models/login_body.dart';
import 'package:james_shop/features/login/domain/models/login_response.dart';
import 'package:james_shop/features/login/domain/repositories/abstract_login_repository.dart';

class LoginUseCase {
  final AbstractLoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<LoginResponse?> execute(LoginBody? body) async {
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
