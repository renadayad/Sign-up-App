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
  final GetStorage authBox=GetStorage();


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