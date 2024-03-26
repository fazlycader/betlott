import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/timer_controller.dart';

import '../controllers/dashboard_screen_controller.dart';

class DashboardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardScreenController>(
      () => DashboardScreenController(),
    );
    Get.put(TimerController());
  }
}
