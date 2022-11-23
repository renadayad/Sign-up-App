import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController{

  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn=GoogleSignIn();
  var displayName="".obs;
  var displayUserPic="".obs;
  var isSignedIn=false;
  var isSignedIan=false;

  final GetStorage authBox=GetStorage();


  void resetPassword(String email) async{

    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();

    } on FirebaseAuthException catch (e) {
      String title= e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message='';
      if (e.code == 'user-not-found') {
        message="No user found for that $email";
      }
      else{
        message=e.message.toString();
      }

      Get.snackbar(
          title,
          message,
          snackPosition:SnackPosition.BOTTOM,
          backgroundColor: Colors.grey,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar(
          "Error!",
          e.toString(),
          snackPosition:SnackPosition.BOTTOM,
          backgroundColor: Colors.grey,
          colorText: Colors.white);
    }
  }


  void signOut()async{
    try{

      await auth.signOut();
      await googleSignIn.signOut();
      displayName.value="";
      displayUserPic.value='';
      isSignedIn=false;
      authBox.remove("auth");
      update();





    }catch(e){
      Get.snackbar(
          "Error!",
          e.toString(),
          snackPosition:SnackPosition.BOTTOM,
          backgroundColor: Colors.grey,
          colorText: Colors.white);
    }

  }

}