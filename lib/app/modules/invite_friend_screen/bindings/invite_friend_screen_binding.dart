import 'package:get/get.dart';

import '../controllers/invite_friend_screen_controller.dart';

class InviteFriendScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InviteFriendScreenController>(
      () => InviteFriendScreenController(),
    );
  }
}
