import 'package:get/get.dart';

import '../controllers/terms_and_sconditions_screen_controller.dart';

class TermsAndSconditionsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsAndSconditionsScreenController>(
      () => TermsAndSconditionsScreenController(),
    );
  }
}
