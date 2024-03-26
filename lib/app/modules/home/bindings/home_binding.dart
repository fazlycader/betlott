import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/dashboard_screen/controllers/dashboard_screen_controller.dart';
import 'package:getx_skeleton/app/modules/my_bet_screen/controllers/my_bet_screen_controller.dart';
import 'package:getx_skeleton/app/modules/news_screen/controllers/news_screen_controller.dart';
import 'package:getx_skeleton/app/modules/profile_screen/controllers/profile_screen_controller.dart';
import 'package:getx_skeleton/app/modules/result_screen/controllers/result_screen_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardScreenController());
    Get.put(ResultScreenController());
    Get.put(MyBetScreenController());
    Get.put(NewsScreenController());
    Get.put(ProfileScreenController());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
