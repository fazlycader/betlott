import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/config/images/image_locations.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        builder: (_) {
          return Center(
            child: Image.asset(
              ImageLocations.appIcon,
              height: 200.0,
              width: 200.0,
            ),
          );
        },
      ),
    );
  }
}
