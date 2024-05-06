import 'package:dio/dio.dart';
import 'package:james_shop/features/login/data/data_sources/abstract_login_api.dart';
import 'package:james_shop/features/login/domain/models/login_body.dart';
import 'package:james_shop/features/login/domain/models/login_response.dart';
import 'package:james_shop/features/login/domain/repositories/abstract_login_repository.dart';

class LoginRepositoryImpl extends AbstractLoginRepository {
  final AbstractLoginApi loginApi;

  LoginRepositoryImpl(this.loginApi);

  @override
  Future<LoginResponse?> login(LoginBody? body) async {
    try {
      final response = await loginApi.login(body);

      return response;
    } on DioException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
