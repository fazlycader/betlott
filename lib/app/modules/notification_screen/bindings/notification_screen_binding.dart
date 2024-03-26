import 'package:get/get.dart';

import '../controllers/notification_screen_controller.dart';

class NotificationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationScreenController>(
      () => NotificationScreenController(),
    );
  }
}
