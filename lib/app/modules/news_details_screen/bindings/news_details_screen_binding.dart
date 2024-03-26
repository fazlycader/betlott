import 'package:get/get.dart';

import '../controllers/news_details_screen_controller.dart';

class NewsDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsDetailsScreenController>(
      () => NewsDetailsScreenController(),
    );
  }
}
