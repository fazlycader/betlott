import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:getx_skeleton/config/theme/my_styles.dart';
import 'package:getx_skeleton/config/theme/my_theme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/data.dart';
import '../controllers/onboard_screen_controller.dart';

class OnboardScreenView extends GetView<OnboardScreenController> {
  OnboardScreenView({Key? key}) : super(key: key);
  final logic = Get.find<OnboardScreenController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => SizedBox(
              height: Get.height,
              child: PageView.builder(
                itemCount: DummyData().sliderList.length,
                controller: logic.pageController.value,
                onPageChanged: (int index) => logic.currentIndexPage.value = index,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Container(
                        width: Get.width,
                        height: Get.height / 1.15,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                          ),
                          color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                ),
                                color: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Skip',
                                          style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                              .bodyMedium
                                              ?.copyWith(
                                                  color: MyStyles.getSubtitleColor(
                                                      isLightTheme: MyTheme().getThemeIsLight)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.asset(DummyData().sliderList[index]['icon'],
                                      height: Get.height / 2.5, alignment: Alignment.center),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                              child: Text(
                                DummyData().sliderList[index]['title'].toString(),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).headlineMedium,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                              child: Text(
                                DummyData().sliderList[index]['description'].toString(),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                    .bodyMedium
                                    ?.copyWith(
                                        color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight)),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 3.0,
                              percent: logic.percent.value,
                              animation: true,
                              progressColor: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight),
                              circularStrokeCap: CircularStrokeCap.round,
                              backgroundColor: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                              backgroundWidth: 1,
                              center: GestureDetector(
                                onTap: () {
                                  logic.currentIndexPage.value < 2
                                      ? logic.percent.value = logic.percent.value + 0.33
                                      : logic.percent.value = 1.0;
                                  logic.currentIndexPage.value < 2
                                      ? logic.pageController.value.nextPage(
                                          duration: const Duration(microseconds: 3000), curve: Curves.bounceInOut)
                                      : Get.toNamed(Routes.WELCOME_SCREEN);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SmoothPageIndicator(
                        controller: logic.pageController.value,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          dotHeight: 5.0,
                          dotWidth: 10.0,
                          activeDotColor: Colors.white,
                          dotColor: Colors.black.withOpacity(.20),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
            )),
      ),
    );
  }
}
