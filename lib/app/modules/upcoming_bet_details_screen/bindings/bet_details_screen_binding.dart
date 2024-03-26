import 'package:get/get.dart';

import '../controllers/bet_details_screen_controller.dart';

class UpComingBetDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpComingBetDetailsScreenController>(
      () => UpComingBetDetailsScreenController(),
    );
  }
}
