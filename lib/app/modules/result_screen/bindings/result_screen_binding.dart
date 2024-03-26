import 'package:get/get.dart';

import '../controllers/result_screen_controller.dart';

class ResultScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultScreenController>(
      () => ResultScreenController(),
    );
  }
}
