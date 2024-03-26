import 'package:get/get.dart';

import '../controllers/edit_profile_screen_controller.dart';

class EditProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileScreenController>(
      () => EditProfileScreenController(),
    );
  }
}
