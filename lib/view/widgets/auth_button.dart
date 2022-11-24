import 'package:flutter/material.dart';

import 'cutsom_text.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({
    required this.text,
    required this.onPressed,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12,
          minimumSize: const Size(360, 50),
        ),
        onPressed: onPressed,
        child:  CustomText(
            text: text,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white));
  }
}