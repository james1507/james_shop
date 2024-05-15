import 'package:dio/dio.dart';
import 'package:james_shop/features/register/data/data_sources/abstract_register_api.dart';
import 'package:james_shop/features/register/domain/repositories/abstract_register_repository.dart';
import 'package:james_shop/shared/domain/entities/auth_body.dart';
import 'package:james_shop/shared/domain/entities/auth_response.dart';

class RegisterRepositoryImpl extends AbstractRegisterRepository {
  final AbstractRegisterApi registerApi;

  RegisterRepositoryImpl(this.registerApi);

  @override
  Future<AuthResponse?> socialLogin(AuthBody? body) async {
    try {
      final response = await registerApi.socialLogin(body);

      return response;
    } on DioException catch (e) {
      final errorResponse = AuthResponse.fromJson(e.response);

      return errorResponse;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<AuthResponse?> register(AuthBody? body) async {
    try {
      final response = await registerApi.register(body);

      return response;
    } on DioException catch (e) {
      final errorResponse = AuthResponse.fromJson(e.response);

      return errorResponse;
    } catch (e) {
      return null;
    }
  }
}
