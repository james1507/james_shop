
import 'package:james_shop/shared/domain/entities/auth_body.dart';

abstract class AbstractSocialAuth {
  Future<AuthBody?> signInWithGoogle();
  Future<AuthBody?> signInWithFacebook();
}
