import 'package:get/get.dart';

import '../controllers/category_details_screen_controller.dart';

class CategoryDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryDetailsScreenController>(
      () => CategoryDetailsScreenController(),
    );
  }
}
