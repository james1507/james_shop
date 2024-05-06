import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:james_shop/shared/data/repositories/abstract_social_auth.dart';

class SocialAuthRepository extends AbstractSocialAuth {
  @override
  Future<UserCredential?> signInWithFacebook() async {
    final result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final accessToken = result.accessToken;
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken!.token);

      return await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
    } else {
      log("${result.message}");

      return null;
    }
  }

  @override
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
