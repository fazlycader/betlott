import 'package:get/get.dart';

import '../controllers/my_profile_screen_controller.dart';

class MyProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyProfileScreenController>(
      () => MyProfileScreenController(),
    );
  }
}
