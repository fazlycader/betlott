import 'package:get/get.dart';

import '../controllers/forget_password_screen_controller.dart';

class ForgetPasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordScreenController>(
      () => ForgetPasswordScreenController(),
    );
  }
}
