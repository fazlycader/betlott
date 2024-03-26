import 'package:get/get.dart';

import '../controllers/deposit_screen_controller.dart';

class DepositScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DepositScreenController>(
      () => DepositScreenController(),
    );
  }
}
