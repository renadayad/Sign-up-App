
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controllers.dart';

class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({super.key});

  final formKey=GlobalKey<FormState>();
  final TextEditingController emailController =TextEditingController();
   final controller=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child:
    Scaffold(
      appBar: AppBar(backgroundColor:Colors.white ,
        centerTitle: true,
        elevation: 0,
        title: Text('Forgot Password' ,style: TextStyle(
            color:Colors.black
        ),
        ),
        leading: IconButton(
          onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back),
        ) ,
      ),

      body: Form(
        key: formKey, child:  SingleChildScrollView(
        child:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(onPressed: (){
                  Get.back();
                },
                  icon: Icon(Icons.close_rounded, color: Colors.white,),),
              ),
              const SizedBox(height: 20,),
              Text("If you want to recover your account, then please provide your email below ..",
                textAlign: TextAlign.center,
                style:TextStyle(color:  Get.isDarkMode ?Colors.white :Colors.black ) ,),
              const SizedBox(height: 30,),
              Image.asset("assets/images/forgetpass copy.png" ,width: 250, ),
              const SizedBox(height: 50,),

              TextFormField(
                controller: emailController,
                obscureText: false,
                validator: (value){
                  if( !RegExp(validationEmail).hasMatch(value)){
                    return "Invalid Email";
                  } else{
                    return null;
                  }
                },
                prefixIcon: Image.asset("assets/images/email.png",color: mainColor,),
                suffixIcon: const Text(""),
                hintText: 'Email',

              ),
              const SizedBox(height: 50,),

              GetBuilder<AuthController>(builder: (_){

                return AuthButton(text: "Reset Password", onPressed: (){

                  if (formKey.currentState!.validate()) {
                    String email = emailController.text.trim();
                    controller.resetPassword(email);
                  }

                });
              })





            ],
          ),
        ),
      ),
      ),
    ));
  }
}