import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api_client.g.dart';

@RestApi()
abstract class AppApiClient {
  factory AppApiClient(Dio dio, {String baseUrl}) = _AppApiClient;

  @POST('/users/register')
  Future<dynamic> register(@Body() Map<String, dynamic> body);

  @POST('/users/login')
  Future<dynamic> login(@Body() Map<String, dynamic> body);

  @POST('/users/social-login')
  Future<dynamic> loginSocial(@Body() Map<String, dynamic> body);
}