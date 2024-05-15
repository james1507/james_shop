import 'package:james_shop/shared/domain/entities/auth_body.dart';
import 'package:james_shop/shared/domain/entities/auth_response.dart';

abstract class AbstractAccountAuthRepository {
  Future<AuthResponse?> socialLogin(AuthBody? body);
}
