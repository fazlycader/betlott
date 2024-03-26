import 'package:get/get.dart';

import '../controllers/search_news_screen_controller.dart';

class SearchNewsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchNewsScreenController>(
      () => SearchNewsScreenController(),
    );
  }
}
