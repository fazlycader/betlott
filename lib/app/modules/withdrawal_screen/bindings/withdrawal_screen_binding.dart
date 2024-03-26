import 'package:get/get.dart';

import '../controllers/withdrawal_screen_controller.dart';

class WithdrawalScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WithdrawalScreenController>(
      () => WithdrawalScreenController(),
    );
  }
}
