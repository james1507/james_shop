import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:james_shop/features/login/domain/models/login_social_body.dart';
import 'package:james_shop/shared/data/repositories/abstract_social_auth.dart';
import 'package:james_shop/shared/domain/enum/social_enum.dart';

class SocialAuthRepository extends AbstractSocialAuth {
  @override
  Future<LoginSocialBody?> signInWithFacebook() async {
    final result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final accessToken = result.accessToken;
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken!.token);

      final userData = await FacebookAuth.instance.getUserData();
      final auth = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      LoginSocialBody? loginBody = LoginSocialBody(
        firstName: userData['first_name'],
        lastName: userData['last_name'],
        socialType: SocialEnum.facebook,
        socialAuthId: userData['id'],
        socialToken: auth.credential?.accessToken ?? "",
      );

      return loginBody;
    } else {
      log("${result.message}");

      return null;
    }
  }

  @override
  Future<LoginSocialBody?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final auth = await FirebaseAuth.instance.signInWithCredential(credential);

      LoginSocialBody? loginBody = LoginSocialBody(
        firstName: googleUser?.displayName ?? "",
        lastName: "",
        socialType: SocialEnum.google,
        socialAuthId: googleAuth?.idToken,
        socialToken: auth.credential?.accessToken ?? "",
      );

      return loginBody;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
