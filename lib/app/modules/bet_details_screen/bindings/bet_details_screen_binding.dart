// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/timer_controller.dart';

import '../controllers/bet_details_screen_controller.dart';

class BetDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BetDetailsScreenController>(
      () => BetDetailsScreenController(),
    );
  }
}
