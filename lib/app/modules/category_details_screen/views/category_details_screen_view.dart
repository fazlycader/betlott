import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../../utils/bet_card_widget.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../components/my_widgets_animator.dart';
import '../controllers/category_details_screen_controller.dart';

class CategoryDetailsScreenView extends GetView<CategoryDetailsScreenController> {
  CategoryDetailsScreenView({Key? key}) : super(key: key);
  final logic = Get.find<CategoryDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryDetailsScreenController>(builder: (logic) {
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
            return DefaultTabController(
              length: 2,
              child: SafeArea(
                child: Scaffold(
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                          ),
                          color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => Get.back(),
                              child: CircleAvatar(
                                backgroundColor: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                radius: 20.0,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                                ),
                              ),
                            ),
                            Text(
                              'Matches',
                              style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                            ),
                            CircleAvatar(
                              backgroundColor: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                              radius: 20.0,
                              child: Icon(
                                Icons.search,
                                color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Material(
                          color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight))),
                          child: TabBar(
                              isScrollable: false,
                              indicator: BoxDecoration(
                                color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              unselectedLabelColor: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                              tabs: const [
                                Tab(
                                  text: 'Live Now',
                                ),
                                Tab(
                                  text: 'Upcoming',
                                ),
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      AutoScaleTabBarView(children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: logic.data.matches?.length ?? 0,
                            itemBuilder: (_, i) {
                              return CategoryBetCardWidget(
                                matches: logic.data.matches![i],
                                isVisible: logic.data.matches![i].status == "0" ? true : false,
                              );
                            }),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: logic.data.matches?.length ?? 0,
                            itemBuilder: (_, i) {
                              return CategoryBetCardWidget(
                                matches: logic.data.matches![i],
                                isVisible: logic.data.matches![i].status == "1" ? true : false,
                              );
                            }),
                      ]),
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
