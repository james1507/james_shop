import 'package:james_shop/features/login/domain/models/login_body.dart';
import 'package:james_shop/features/login/domain/models/login_response.dart';
import 'package:james_shop/features/login/domain/models/login_social_body.dart';

abstract class AbstractLoginRepository {
  Future<LoginResponse?> login(LoginBody? body);
  Future<LoginResponse?> socialLogin(LoginSocialBody? body);
}
