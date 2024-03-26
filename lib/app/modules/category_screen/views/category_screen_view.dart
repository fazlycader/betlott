import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../components/my_widgets_animator.dart';
import '../../dashboard_screen/controllers/dashboard_screen_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/category_screen_controller.dart';

class CategoryScreenView extends GetView<CategoryScreenController> {
  const CategoryScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardScreenController>(builder: (logic) {
      final homeLogic = Get.find<HomeController>();
      return MyWidgetsAnimator(
          apiCallStatus: logic.apiCallStatus,
          loadingWidget: () {
            return Scaffold(
              body: Center(child: getLoadingIndicator(msg: 'Loading Data')),
            );
          },
          errorWidget: () {
            return Scaffold(
              body: Center(child: getLoadingIndicator(msg: 'Please Try Again')),
            );
          },
          successWidget: () {
            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                          ),
                          color: MyStyles.getContainerColor(
                              isLightTheme: MyTheme().getThemeIsLight),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => homeLogic.currentIndex(0),
                              child: CircleAvatar(
                                backgroundColor: MyStyles.getSecondaryColor(
                                    isLightTheme: MyTheme().getThemeIsLight),
                                radius: 20.0,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: MyStyles.getIconTheme(
                                          isLightTheme:
                                              MyTheme().getThemeIsLight)
                                      .color,
                                ),
                              ),
                            ),
                            Text(
                              'Sports',
                              style: MyStyles.getTextTheme(
                                      isLightTheme: MyTheme().getThemeIsLight)
                                  .titleLarge,
                            ),
                            CircleAvatar(
                              backgroundColor: MyStyles.getSecondaryColor(
                                  isLightTheme: MyTheme().getThemeIsLight),
                              radius: 20.0,
                              child: Icon(
                                Icons.search,
                                color: MyStyles.getIconTheme(
                                        isLightTheme: MyTheme().getThemeIsLight)
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // itemCount: logic.data.category?.length ?? 0,
                          itemCount: 0,
                          itemBuilder: (_, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: MyStyles.getContainerColor(
                                      isLightTheme: MyTheme().getThemeIsLight),
                                  border: Border(
                                      bottom: BorderSide(
                                          color: MyStyles.getSubtitleColor(
                                              isLightTheme:
                                                  MyTheme().getThemeIsLight)))),
                              // child: ListTile(
                              //   onTap: () => Get.toNamed(
                              //       Routes.CATEGORY_DETAILS_SCREEN,
                              //       arguments: [
                              //         logic.data.category?[index].slug ?? ''
                              //       ]),
                              //   title: Text(
                              //     logic.data.category?[index].name ?? '',
                              //     style: MyStyles.getTextTheme(
                              //             isLightTheme:
                              //                 MyTheme().getThemeIsLight)
                              //         .bodyMedium,
                              //   ),
                              //   trailing: Icon(
                              //     Icons.arrow_forward_ios,
                              //     size: 14.0,
                              //     color: MyStyles.getIconTheme(
                              //             isLightTheme:
                              //                 MyTheme().getThemeIsLight)
                              //         .color,
                              //   ),
                              // ),
                            );
                          })
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
