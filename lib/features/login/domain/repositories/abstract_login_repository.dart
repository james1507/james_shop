import 'package:james_shop/features/login/domain/models/login_body.dart';
import 'package:james_shop/features/login/domain/models/login_response.dart';

abstract class AbstractLoginRepository {
  Future<LoginResponse?> login(LoginBody? body);
}
