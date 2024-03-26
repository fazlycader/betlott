import 'package:get/get.dart';

import '../controllers/news_screen_controller.dart';

class NewsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsScreenController>(
      () => NewsScreenController(),
    );
  }
}
