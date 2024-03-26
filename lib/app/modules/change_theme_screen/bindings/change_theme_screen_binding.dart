import 'package:get/get.dart';

import '../controllers/change_theme_screen_controller.dart';

class ChangeThemeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeThemeScreenController>(
      () => ChangeThemeScreenController(),
    );
  }
}
