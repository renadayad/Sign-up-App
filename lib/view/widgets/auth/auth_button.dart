import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signup/utils/text_utils.dart';
import 'package:signup/utils/theme.dart';
import 'package:sizer/sizer.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({required this.onPressed, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        minimumSize: Size(160, 48),
      ),
      child: TextUtils(
        color: Colors.white,
        text: text,
        fontsize: 14,
        fontWeight: FontWeight.w500,
        underLine: TextDecoration.none,
      ),
    );
  }
}
