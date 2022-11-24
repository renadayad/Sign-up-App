import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signup/utils/my_string.dart';
import 'package:signup/utils/theme.dart';
import 'package:signup/view/screens/widget/auth/authButton.dart';
import 'package:signup/view/screens/widget/auth/authTextFormField.dart';
import 'package:signup/view/screens/widget/textUtilities.dart';

import '../../../logic/controller/authController.dart';
import '../../../routes/routes.dart';
import '../widget/signUpByButton.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 154, bottom: 363, right: 45, left: 55),
          child: Column(
            children: [
              const TextUtilities(
                  text: 'Sign Up by',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: mainColor,
                  textDecoration: TextDecoration.none),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  GetBuilder<AuthController>(builder: (_) {
                    return SignUpBy(
                      bgcolor: googleColor,
                      onPressed: () async {
                        await controller.googleSignUpApp();
                      },
                      text: 'with Google',
                      path: 'assets/images/google.png',
                    );
                  }),
                  const SizedBox(
                    width: 16,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return SignUpBy(
                      bgcolor: Colors.black,
                      onPressed: () {},
                      text: 'with Apple',
                      path: 'assets/images/apple.png',
                    );
                  },),
                ],
              ),
              const SizedBox(
                height: 54,
              ),
              const TextUtilities(
                  text: 'or',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: mainColor,
                  textDecoration: TextDecoration.none),
              const SizedBox(
                height: 32,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextUtilities(
                        text: 'E-mail',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: mainColor,
                        textDecoration: TextDecoration.none),
                    const SizedBox(
                      height: 10,
                    ),
                    AuthTextFormField(
                      controller: emailController,
                      obscureText: false,
                      prefixIcon: const Icon(
                        Icons.person_2_outlined,
                        color: mainColor,
                      ),
                      suffixIcon: const Text(''),
                      validator: (value) {
                        if (!RegExp(validationEmail).hasMatch(value)) {
                          return 'Invalid Email';
                        } else {
                          return null;
                        }
                      },
                      hintText: 'Enter your E-mail',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const TextUtilities(
                        text: 'Password',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: mainColor,
                        textDecoration: TextDecoration.none),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) {
                        return AuthTextFormField(
                          controller: passwordController,
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: mainColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.visibilty();
                            },
                            icon: controller.isVisibilty
                                ? const Icon(
                                    Icons.visibility_outlined,
                                    color: mainColor,
                                    size: 20,
                                  )
                                : const Icon(
                                    Icons.visibility_off_outlined,
                                    color: mainColor,
                                    size: 20,
                                  ),
                          ),
                          obscureText: controller.isVisibilty ? false : true,
                          validator: (value) {
                            if (!RegExp(validationPassword).hasMatch(value)) {
                              return 'Password length must be 8 and contain a number,\n a special symbol, and an uppercase letter.';
                            } else {
                              return null;
                            }
                          },
                          hintText: 'Enter your password',
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const TextUtilities(
                        text: 'Re-Password',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: mainColor,
                        textDecoration: TextDecoration.none),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) {
                        return AuthTextFormField(
                          controller: rePasswordController,
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: mainColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.visibilty();
                            },
                            icon: controller.isVisibilty
                                ? const Icon(
                                    Icons.visibility_outlined,
                                    color: mainColor,
                                    size: 20,
                                  )
                                : const Icon(
                                    Icons.visibility_off_outlined,
                                    color: mainColor,
                                    size: 20,
                                  ),
                          ),
                          obscureText: controller.isVisibilty ? false : true,
                          validator: (value) {
                            if (value != passwordController.text) {
                              return 'The entered password does not match.';
                            } else {
                              return null;
                            }
                          },
                          hintText: 'Enter your password again',
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  String email = emailController.text.trim();
                                  String password = passwordController.text;

                                  controller.signUpUsingFirebase(
                                      email: email, password: password);
                                }
                              },
                              text: 'Sign Up');
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextUtilities(
                            text: 'Already have account ?',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: mainColor,
                            textDecoration: TextDecoration.none),
                        const SizedBox(
                          width: 2,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offNamed(Routes.loginScreen);
                          },
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(50, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerLeft),
                          child: const TextUtilities(
                              text: 'Login',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: buttonColor,
                              textDecoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
