import 'package:dio/dio.dart';
import 'package:james_shop/core/network/api_client/app_api_client.dart';
import 'package:james_shop/core/utils/constant/network_constant.dart';
import 'package:james_shop/features/register/data/data_sources/abstract_register_api.dart';
import 'package:james_shop/shared/domain/entities/auth_body.dart';
import 'package:james_shop/shared/domain/entities/auth_response.dart';

class RegisterRepositoryApi extends AbstractRegisterApi {
  late AppApiClient apiClient;
  final Dio dio;

  RegisterRepositoryApi(this.dio) {
    apiClient = AppApiClient(dio, baseUrl: NetworkConstant.apiUrl);
  }

  @override
  Future<AuthResponse?> socialLogin(AuthBody? body) async {
    try {
      final response = await apiClient.loginSocial(body?.toJson() ?? {});

      final loginResponse = AuthResponse.fromJson(response);

      return loginResponse;
    } on DioException catch (e) {
      final errorResponse = AuthResponse.fromJson(e.response?.data);

      return errorResponse;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<AuthResponse?> register(AuthBody? body) async {
    try {
      final response = await apiClient.register(body?.toJson() ?? {});

      final loginResponse = AuthResponse.fromJson(response);

      return loginResponse;
    } on DioException catch (e) {
      final errorResponse = AuthResponse.fromJson(e.response?.data);

      return errorResponse;
    } catch (e) {
      return null;
    }
  }
}
