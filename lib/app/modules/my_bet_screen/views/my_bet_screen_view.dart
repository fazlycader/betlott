import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/home/controllers/home_controller.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../../utils/my_bet_widget.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../components/my_widgets_animator.dart';
import '../controllers/my_bet_screen_controller.dart';

class MyBetScreenView extends GetView<MyBetScreenController> {
  const MyBetScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyBetScreenController>(builder: (logic) {
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
            return DefaultTabController(
              length: 4,
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
                              onTap: () => homeLogic.currentIndex(0),
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
                              'My Bet',
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
                      const SizedBox(
                        height: 20.0,
                      ),
                      Material(
                        color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                        child: TabBar(
                            indicator: BoxDecoration(
                              color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight),
                            ),
                            unselectedLabelColor: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                            tabs: const [
                              Tab(
                                text: 'All',
                              ),
                              Tab(
                                text: 'Pending',
                              ),
                              Tab(
                                text: 'Wins',
                              ),
                              Tab(
                                text: 'Loses',
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: Get.height / 1.45,
                        width: Get.width,
                        child: TabBarView(children: [
                          ListView.builder(
                              itemCount: logic.betLogModel.logs?.length ?? 0,
                              itemBuilder: (_, i) {
                                return MyBetWidget(
                                  betLogModel: logic.betLogModel,
                                  index: i,
                                  visible: "3",
                                );
                              }),
                          ListView.builder(
                              itemCount: logic.betLogModel.logs?.length ?? 0,
                              itemBuilder: (_, i) {
                                return MyBetWidget(
                                  betLogModel: logic.betLogModel,
                                  index: i,
                                  visible: "0",
                                );
                              }),
                          ListView.builder(
                              itemCount: logic.betLogModel.logs?.length ?? 0,
                              itemBuilder: (_, i) {
                                return MyBetWidget(
                                  betLogModel: logic.betLogModel,
                                  index: i,
                                  visible: "1",
                                );
                              }),
                          ListView.builder(
                              itemCount: logic.betLogModel.logs?.length ?? 0,
                              itemBuilder: (_, i) {
                                return MyBetWidget(
                                  betLogModel: logic.betLogModel,
                                  index: i,
                                  visible: "-1",
                                );
                              }),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
