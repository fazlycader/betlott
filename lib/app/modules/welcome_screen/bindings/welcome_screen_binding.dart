import 'package:get/get.dart';

import '../controllers/welcome_screen_controller.dart';

class WelcomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeScreenController>(
      () => WelcomeScreenController(),
    );
  }
}
