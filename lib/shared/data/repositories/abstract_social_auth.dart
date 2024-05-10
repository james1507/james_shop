import 'package:james_shop/features/login/domain/models/login_social_body.dart';

abstract class AbstractSocialAuth {
  Future<LoginSocialBody?> signInWithGoogle();
  Future<LoginSocialBody?> signInWithFacebook();
}
