import 'package:get/get.dart';

import '../controllers/bet_participant_list_screen_controller.dart';

class BetParticipantListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BetParticipantListScreenController>(
      () => BetParticipantListScreenController(),
    );
  }
}
