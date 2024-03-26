import 'package:get/get.dart';

import '../controllers/bet_details_screen_controller.dart';

class CategoryBetDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryBetDetailsScreenController>(
      () => CategoryBetDetailsScreenController(),
    );
  }
}
