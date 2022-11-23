
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signup/view/screens/auth/log_out_.dart';

import '../../logic/controllers/auth_controllers.dart';
import '../widgets/cutsom_text.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);


  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return
        Obx(
              () =>
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    text:"Hello ${authController.displayName.value}"
                    ,
                    color:  Colors.black,
                  ),
                  CustomText(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    text: authController.displayEmail.value,
                    color:  Colors.black,
                  ),

                  LogOut(),
                ],


              ),



    );
  }
}
