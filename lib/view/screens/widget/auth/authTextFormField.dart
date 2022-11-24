import 'package:flutter/material.dart';
import 'package:signup/utils/theme.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;

  const AuthTextFormField(
      {required this.controller,
      required this.obscureText,
      required this.validator,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.hintText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: mainColor,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(153, 162, 165, 0.47),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        filled: false,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: mainColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: mainColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
