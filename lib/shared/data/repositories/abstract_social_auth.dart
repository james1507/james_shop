

import 'package:firebase_auth/firebase_auth.dart';

abstract class AbstractSocialAuth {
  Future<UserCredential?> signInWithGoogle();
  Future<UserCredential?> signInWithFacebook();
}