import 'package:james_shop/shared/domain/entities/auth_body.dart';
import 'package:james_shop/shared/domain/entities/auth_response.dart';

abstract class AbstractRegisterRepository {
  Future<AuthResponse?> register(AuthBody? body);
  Future<AuthResponse?> socialLogin(AuthBody? body);
}
