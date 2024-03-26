import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/my_widgets_animator.dart';
import 'package:getx_skeleton/app/components/timer_controller.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';
import 'package:intl/intl.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../../utils/bet_card_widget.dart';
import '../../../components/custom_loading_overlay.dart';
import '../controllers/dashboard_screen_controller.dart';

class DashboardScreenView extends GetView<DashboardScreenController> {
  DashboardScreenView({Key? key}) : super(key: key);
  String cdate = DateFormat("dd/MM/yy").format(DateTime.now());
  final timerController = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardScreenController>(builder: (logic) {
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
              child: DefaultTabController(
                length: 2,
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
                              Row(
                                children: [
                                  // CircleAvatar(
                                  //   backgroundColor: MyStyles.getSecondaryColor(
                                  //       isLightTheme:
                                  //           MyTheme().getThemeIsLight),
                                  //   radius: 30.0,
                                  //   backgroundImage: NetworkImage(
                                  //       logic.profile.user?.imageUrl ?? ''),
                                  // ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hello, ${logic.profile.user?.name}',
                                        style: MyStyles.getTextTheme(
                                                isLightTheme:
                                                    MyTheme().getThemeIsLight)
                                            .titleLarge,
                                      ),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 10.0,
                                            right: 2.0,
                                            top: 2.0,
                                            bottom: 2.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          border: Border.all(
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                          color: Colors.white.withOpacity(0.1),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              '\$${logic.profile.user?.balance}',
                                              style: MyStyles.getTextTheme(
                                                      isLightTheme: MyTheme()
                                                          .getThemeIsLight)
                                                  .bodyMedium,
                                            ),
                                            const SizedBox(
                                              width: 6.0,
                                            ),
                                            Icon(Icons.monetization_on,
                                                color: MyStyles.getPrimaryColor(
                                                    isLightTheme: MyTheme()
                                                        .getThemeIsLight)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: MyStyles.getSecondaryColor(
                                        isLightTheme:
                                            MyTheme().getThemeIsLight),
                                    radius: 20.0,
                                    child: Icon(
                                      Icons.search,
                                      color: MyStyles.getIconTheme(
                                              isLightTheme:
                                                  MyTheme().getThemeIsLight)
                                          .color,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: MyStyles.getSecondaryColor(
                                        isLightTheme:
                                            MyTheme().getThemeIsLight),
                                    radius: 20.0,
                                    child: Icon(
                                      Icons.notifications_active,
                                      color: MyStyles.getIconTheme(
                                              isLightTheme:
                                                  MyTheme().getThemeIsLight)
                                          .color,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 200.0,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(20.0),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: logic.data.slider?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Image.network(
                                        logic.data.slider?[index].imageUrl ??
                                            '',
                                        height: 150.0,
                                        width: Get.width / 1.2,
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Select your match',
                                    style: MyStyles.getTextTheme(
                                            isLightTheme:
                                                MyTheme().getThemeIsLight)
                                        .titleLarge,
                                  ),
                                  const SizedBox(height: 10),

                                  ListView.builder(
  shrinkWrap: true,
  itemCount: logic.gameDetailsList.length,
  itemBuilder: (_, index) {
    final game = logic.gameDetailsList[index];
    final gameName = game.gameName;
    final gameStartTime = DateTime.parse(game.gameStartTime);
    final betClosingTime = DateTime.parse(game.betClosingTime);
    final gameEndTime = DateTime.parse(game.gameEndTime);
    final currentTime = DateTime.now();

    if (currentTime.isAfter(gameStartTime) &&
        currentTime.isBefore(betClosingTime)) {
      // Betting is still open
      return BetCardWidget(
        gameName: gameName,
        status: 'Betting Open',
        // Other necessary parameters for open betting card
      );
    } else if (currentTime.isAfter(betClosingTime) &&
        currentTime.isBefore(gameEndTime)) {
      // Betting is closed
      return BetCardWidget(
        gameName: gameName,
        status: 'Betting Closed',
        // Other necessary parameters for closed betting card
      );
    } else if (currentTime.isAfter(gameEndTime)) {
      // Game has ended
      return BetCardWidget(
        gameName: gameName,
        status: 'Game Ended',
        // Other necessary parameters for game ended card
      );
    } else {
      // No match found
      return Container(); // Or any placeholder widget
    }
  },
),


                                  const SizedBox(height: 10),
                                  // const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    });
  }
}
