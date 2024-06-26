import 'package:dio/dio.dart';
import 'package:james_shop/features/login/data/data_sources/abstract_login_api.dart';

import 'package:james_shop/features/login/domain/repositories/abstract_login_repository.dart';
import 'package:james_shop/shared/domain/entities/auth_body.dart';
import 'package:james_shop/shared/domain/entities/auth_response.dart';

class LoginRepositoryImpl extends AbstractLoginRepository {
  final AbstractLoginApi loginApi;

  LoginRepositoryImpl(this.loginApi);

  @override
  Future<AuthResponse?> login(AuthBody? body) async {
    try {
      final response = await loginApi.login(body);

      return response;
    } on DioException catch (e) {
      final errorResponse = AuthResponse.fromJson(e.response);

      return errorResponse;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<AuthResponse?> socialLogin(AuthBody? body) async {
    try {
      final response = await loginApi.socialLogin(body);

      return response;
    } on DioException catch (e) {
      final errorResponse = AuthResponse.fromJson(e.response);

      return errorResponse;
    } catch (e) {
      return null;
    }
  }
}
