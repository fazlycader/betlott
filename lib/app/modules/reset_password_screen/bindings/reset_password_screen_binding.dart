import 'package:get/get.dart';

import '../controllers/reset_password_screen_controller.dart';

class ResetPasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordScreenController>(
      () => ResetPasswordScreenController(),
    );
  }
}
