import 'package:flutter/material.dart';
import 'package:signup/utils/theme.dart';
import 'package:signup/view/screens/widget/textUtilities.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  AuthButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor, minimumSize: const Size(160, 48)),
      child: TextUtilities(
          text: text,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          textDecoration: TextDecoration.none),
    );
  }
}
