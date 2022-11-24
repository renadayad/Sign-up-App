import 'package:get/route_manager.dart';
import 'package:signup/logic/bindings/auth_biniding.dart';
import 'package:signup/view/screens/auth/forgot_password.dart';
import 'package:signup/view/screens/auth/login_screen.dart';
import 'package:signup/view/screens/auth/signup_screen.dart';

class AppRoutes {
  static const login = Routes.loginScreen;

  static final routes = [
    GetPage(
        name: Routes.loginScreen,
        page: () => Login_Screen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signScreen,
        page: () => Signup_Screen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgotpasswordScreen,
        page: () => ForgotPassword_Screen(),
        binding: AuthBinding())
  ];
}

class Routes {
  static const loginScreen = '/loginScreen';
  static const signScreen = '/signScreen';
  static const forgotpasswordScreen = '/forgotpasswordScreen';
}
