import 'package:get/get.dart';

import '../controllers/my_bet_screen_controller.dart';

class MyBetScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyBetScreenController>(
      () => MyBetScreenController(),
    );
  }
}
