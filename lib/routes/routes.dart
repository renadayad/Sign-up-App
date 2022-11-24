import 'package:get/get.dart';
import 'package:signup/logic/bindings/auth_biniding.dart';
import 'package:signup/view/screens/auth/signUp_screen.dart';

import '../view/screens/auth/login_screen.dart';

class AppRoutes {
  static const singUp = Routes.signUpScreen;
  static final routes = [
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.loginScreen, 
      page: () => Login_Screen(),
      ),
  ];
}

class Routes {
  static const signUpScreen = '/signUpScreen';
  static const loginScreen = '/loginScreen';
}
