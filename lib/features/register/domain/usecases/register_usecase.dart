import 'package:dio/dio.dart';
import 'package:james_shop/features/register/domain/repositories/abstract_register_repository.dart';
import 'package:james_shop/shared/domain/entities/auth_body.dart';
import 'package:james_shop/shared/domain/entities/auth_response.dart';

class RegisterUseCase {
  final AbstractRegisterRepository _loginRepository;

  RegisterUseCase(this._loginRepository);

  Future<AuthResponse?> execute(AuthBody? body) async {
    try {
      final response = await _loginRepository.register(body);

      return response;
    } on DioException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
