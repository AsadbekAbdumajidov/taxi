import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taxi_app/core/services/firebase_detail.dart';
import 'package:taxi_app/presentation/components/controller.dart';

class FirebaseService {
  GoogleSignInAccount? googleAccount;
  final GoogleSignIn _gogleSignIn = GoogleSignIn();

  // ? Sign in with goole
  Future<UserCredential> signInWithGoogle() async {
    googleAccount = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleAccount?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // ? Log out
  signOut(context) async {
    googleAccount = await _gogleSignIn.signOut().then(
          (value) => value == null
              ? Navigator.pushNamed(context, '/')
              : Navigator.pushNamed(context, '/acc'),
        );
  }

  // ? Sign Up
  static Future singUp(String e, String p) async {
    try {
      UserCredential _credential = await FireBaseServiceDetail.authUser
          .createUserWithEmailAndPassword(email: e, password: p);
      User? user = _credential.user;
      await user!.sendEmailVerification();
      debugPrint("User: ${user.email}");

      return user;
    } catch (e) {
      debugPrint("User error");

      return false;
    }
  }

  // ?  Sing In
  static Future signInFunction(String e, String p) async {
    try {
      UserCredential _signedUser =
          await FireBaseServiceDetail.authUser.signInWithEmailAndPassword(
        email: e,
        password: p,
      );
      User? user = _signedUser.user;
      await user!.sendEmailVerification();
      return user;
    } catch (e) {
      return null;
    }
  }

  // ? Phone Sing In
  static String id = "";
  static Future verifySms() async {
    await FireBaseServiceDetail.authUser.verifyPhoneNumber(
        phoneNumber: "+998${Controller.phone.text}",
        verificationCompleted: (v) async {
          await FirebaseAuth.instance.signInWithCredential(v);
        },
        verificationFailed: (v) {},
        codeSent: (verificationId, resendToken) async {
          id = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          id = verificationId;
        },
        timeout: const Duration(seconds: 60));
  }
}
