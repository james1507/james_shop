import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:james_shop/core/helper/helper.dart';
import 'package:james_shop/features/login/domain/models/login_social_body.dart';
import 'package:james_shop/shared/data/repositories/abstract_social_auth.dart';
import 'package:james_shop/shared/domain/enum/social_enum.dart';

class SocialAuthRepository extends AbstractSocialAuth {
  @override
  Future<LoginSocialBody?> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance
          .login(permissions: ['public_profile', 'email']);

      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken;
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken!.token);

        final userData = await FacebookAuth.instance.getUserData();
        final auth = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        LoginSocialBody? loginBody = LoginSocialBody(
          email: auth.user?.email ?? "",
          firstName: auth.user?.displayName?.split(" ").first,
          lastName: auth.user?.displayName?.split(" ").last,
          socialType: SocialEnum.facebook,
          socialAuthId: userData['id'],
          socialToken: accessToken.token,
        );

        return loginBody;
      } else {
        Helper.showToast(result.message ?? "");
        return null;
      }
    } catch (e) {
      Helper.showToast("$e");
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
        email: auth.user?.email ?? "",
        firstName: (googleUser?.displayName ?? "").split(" ").first,
        lastName: (googleUser?.displayName ?? "").split(" ").last,
        socialType: SocialEnum.google,
        socialAuthId: await auth.user?.getIdToken(),
        socialToken: googleAuth?.accessToken ?? "",
      );

      return loginBody;
    } catch (e) {
      Helper.showToast("$e");
      return null;
    }
  }
}
