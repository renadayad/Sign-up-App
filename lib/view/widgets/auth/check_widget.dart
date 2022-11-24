import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:signup/logic/controllers/auth_controllers.dart';
import 'package:signup/routes/routes.dart';
import 'package:signup/utils/text_utils.dart';
import 'package:signup/utils/theme.dart';
import 'package:sizer/sizer.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.CheckBox();
            },
            child: Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  color: labalColor, borderRadius: BorderRadius.circular(4)),
              child: controller.isCheckBox
                  ? Icon(
                      Icons.done,
                      size: 15,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.crop_square_rounded,
                      size: 15,
                      color: Colors.white,
                    ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          TextUtils(
              text: "Remember me ",
              color: labalColor,
              fontWeight: FontWeight.normal,
              fontsize: 12,
              underLine: TextDecoration.none),
          SizedBox(
            width: 14,
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: (() {
                    Get.toNamed(Routes.forgotpasswordScreen);
                  }),
                  child: TextUtils(
                      text: "Don't remember the password? ",
                      color: labalColor,
                      fontWeight: FontWeight.normal,
                      fontsize: 10,
                      underLine: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      );
    });
  }
}
