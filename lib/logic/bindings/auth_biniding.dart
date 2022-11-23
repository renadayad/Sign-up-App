import 'package:get/instance_manager.dart';

import '../controllers/auth_controllers.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
