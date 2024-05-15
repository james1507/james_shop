import 'package:james_shop/features/login/domain/models/login_response.dart';
import 'package:james_shop/features/login/domain/models/login_social_body.dart';

abstract class AbstractAccountAuthRepository {
  Future<LoginResponse?> socialLogin(LoginSocialBody? body);
}
