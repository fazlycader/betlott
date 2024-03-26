import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

import '../../../../config/images/image_locations.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../controllers/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  const WelcomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: Get.width,
              padding: const EdgeInsets.only(top: 60.0, bottom: 60.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                color: MyStyles.getSecondaryColor(
                    isLightTheme: MyTheme().getThemeIsLight),
              ),
              child: Image.asset(
                ImageLocations.fullLogoDark,
                height: 50,
                width: 150,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Text(
              'Let’s Get Started',
              style:
                  MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                      .headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Login to your account below or signup for an amazing experience',
                textAlign: TextAlign.center,
                style: MyStyles.getTextTheme(
                        isLightTheme: MyTheme().getThemeIsLight)
                    .bodyMedium
                    ?.copyWith(
                        color: MyStyles.getSubtitleColor(
                            isLightTheme: MyTheme().getThemeIsLight)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.LOGIN_SCREEN);
                },
                style: MyStyles.getElevatedButtonTheme(
                        isLightTheme: MyTheme().getThemeIsLight)
                    .style
                    ?.copyWith(
                      textStyle: MyStyles.getElevatedButtonTextStyle(
                          MyTheme().getThemeIsLight,
                          isBold: false,
                          fontSize: 16.sp),
                    ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Have an Account? Login'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.REGISTRATION_SCREEN);
                },
                style: MyStyles.getElevatedButtonTheme(
                        isLightTheme: MyTheme().getThemeIsLight)
                    .style
                    ?.copyWith(
                      textStyle: MyStyles.getElevatedButtonTextStyle(
                          MyTheme().getThemeIsLight,
                          isBold: false,
                          fontSize: 16.sp),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return MyStyles.getSubtitleColor(
                            isLightTheme: MyTheme().getThemeIsLight);
                      }),
                    ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Join us, It’s Free'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
