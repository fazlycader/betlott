import 'package:get/get.dart';

import '../controllers/create_bet_comment_screen_controller.dart';

class CreateBetCommentScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateBetCommentScreenController>(
      () => CreateBetCommentScreenController(),
    );
  }
}
