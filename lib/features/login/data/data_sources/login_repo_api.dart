import 'package:dio/dio.dart';
import 'package:james_shop/core/network/api_client/app_api_client.dart';
import 'package:james_shop/core/utils/constant/network_constant.dart';
import 'package:james_shop/features/login/data/data_sources/abstract_login_api.dart';
import 'package:james_shop/features/login/domain/models/login_body.dart';
import 'package:james_shop/features/login/domain/models/login_response.dart';
import 'package:james_shop/features/login/domain/models/login_social_body.dart';

class LoginRepositoryApi extends AbstractLoginApi {
  late AppApiClient apiClient;
  final Dio dio;

  LoginRepositoryApi(this.dio) {
    apiClient = AppApiClient(dio, baseUrl: NetworkConstant.apiUrl);
  }

  @override
  Future<LoginResponse?> login(LoginBody? body) async {
    try {
      final response = await apiClient.login(body?.toJson());

      final loginResponse = LoginResponse.fromJson(response);

      return loginResponse;
    } on DioException catch (e) {
      final errorResponse = LoginResponse.fromJson(e.response?.data);

      return errorResponse;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<LoginResponse?> socialLogin(LoginSocialBody? body) async {
    try {
      final response = await apiClient.loginSocial(body?.toJson());

      final loginResponse = LoginResponse.fromJson(response);

      return loginResponse;
    } on DioException catch (e) {
      final errorResponse = LoginResponse.fromJson(e.response?.data);

      return errorResponse;
    } catch (e) {
      return null;
    }
  }
}
