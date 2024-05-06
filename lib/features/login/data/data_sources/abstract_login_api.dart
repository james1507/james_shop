import 'package:james_shop/features/login/domain/models/login_body.dart';
import 'package:james_shop/features/login/domain/models/login_response.dart';

abstract class AbstractLoginApi {
  Future<LoginResponse?> login(LoginBody? body);
}
