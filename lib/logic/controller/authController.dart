import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:signup/routes/routes.dart';

class AuthController extends GetxController {
  bool isVisibilty = false;
  var isSignedIn = false;
  var displayName = '';

  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSingIn = GoogleSignIn();

  void visibilty() {
    isVisibilty = !isVisibilty;
    update();
  }

  void signUpUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      update();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (e.code == 'email-already-in-use') {
        message = 'Email already used';
      } else {
        message = e.message.toString();
      }

      // Get.snackbar(
      //   title,
      //   message,
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red[400],
      //   colorText: Colors.white,
      // );
    } catch (error) {
      // Get.snackbar(
      //   'Error!',
      //   error.toString(),
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red[400],
      //   colorText: Colors.white,
      // );
    }
  }

  Future<void> googleSignUpApp() async {
    try {
      final googleUser = await googleSingIn.signIn();

      isSignedIn = true;
      update();
      Get.offNamed(Routes.loginScreen);
    } catch (error) {
      // Get.snackbar(
      //   'Error!',
      //   error.toString(),
      //   snackPosition: SnackPosition.TOP,
      //   backgroundColor: Colors.red[400],
      //   colorText: Colors.white,
      // );
    }
  }
}
