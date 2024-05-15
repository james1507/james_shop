import 'package:dio/dio.dart';
import 'package:james_shop/core/network/api_client/app_api_client.dart';
import 'package:james_shop/core/utils/constant/network_constant.dart';
import 'package:james_shop/features/account_auth/data/data_sources/abstract_account_auth_api.dart';
import 'package:james_shop/shared/domain/entities/auth_body.dart';
import 'package:james_shop/shared/domain/entities/auth_response.dart';

class AccountAuthRepositoryApi extends AbstractAccountAuthApi {
  late AppApiClient apiClient;
  final Dio dio;

  AccountAuthRepositoryApi(this.dio) {
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
}
