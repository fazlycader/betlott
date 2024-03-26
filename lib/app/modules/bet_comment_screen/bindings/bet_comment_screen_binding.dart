import 'package:get/get.dart';

import '../controllers/bet_comment_screen_controller.dart';

class BetCommentScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BetCommentScreenController>(
      () => BetCommentScreenController(),
    );
  }
}
