import 'package:get/get.dart';

import '../controllers/my_wallet_screen_controller.dart';

class MyWalletScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyWalletScreenController>(
      () => MyWalletScreenController(),
    );
  }
}
