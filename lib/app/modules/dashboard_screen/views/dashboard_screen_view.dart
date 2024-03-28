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
                                      final winningPrice = game.winningPrice;
                                      final currentTime = DateTime.now();
                                      final timeParts =
                                          game.gameStartTime.split(':');
                                      final hour = int.parse(timeParts[0]);
                                      final minute = int.parse(timeParts[1]);
                                      final second = int.parse(timeParts[2]);
                                      final gameStartTime = DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          hour,
                                          minute,
                                          second);

                                      final timepartsBetclosingtime =
                                          game.betClosingTime.split(':');
                                      final hourBetclosingtime =
                                          int.parse(timepartsBetclosingtime[0]);
                                      final minuteBetclosingtime =
                                          int.parse(timepartsBetclosingtime[1]);
                                      final secondBetclosingtime =
                                          int.parse(timepartsBetclosingtime[2]);
                                      final betClosingTime = DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          hourBetclosingtime,
                                          minuteBetclosingtime,
                                          secondBetclosingtime);

                                      final gameendtimeTimeparts =
                                          game.gameEndTime.split(':');
                                      final gameendtimeHour =
                                          int.parse(gameendtimeTimeparts[0]);
                                      final gameendtimeMinute =
                                          int.parse(gameendtimeTimeparts[1]);
                                      final gameendtimeSecond =
                                          int.parse(gameendtimeTimeparts[2]);
                                      final gameEndTime = DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          gameendtimeHour,
                                          gameendtimeMinute,
                                          gameendtimeSecond);

                                      final startTime = DateFormat("HH:mm:ss")
                                          .parse(game.gameStartTime);
                                      final betCloseTime =
                                          DateFormat("HH:mm:ss")
                                              .parse(game.betClosingTime);
                                      final betendTime = DateFormat("HH:mm:ss")
                                          .parse(game.gameEndTime);

                                      if (currentTime.isAfter(gameStartTime) &&
                                          currentTime
                                              .isBefore(betClosingTime)) {
                                        List<WinningNumbers>
                                            winningNumbersList = controller
                                                .winningNumbersList
                                                .map((numberString) {
                                          // Convert each string to a WinningNumbers object
                                          return WinningNumbers(
                                            date: DateTime
                                                .now(), // Set the date as needed
                                            winningNumbers: [
                                              numberString
                                            ], // Assuming each string represents one winning number
                                          );
                                        }).toList();

                                        final winningNumbersForCurrentDate =
                                            getWinningNumbersForCurrentDate(
                                                winningNumbersList);

                                        var now = DateTime.now();
                                        var formatter = DateFormat('dd/MM/yy');
                                        DateTime formattedDate =
                                            formatter.format(now) as DateTime;
                                        // Betting is still open
                                        return ActiveBetCardWidget(
                                          gameName: gameName,
                                          status: 'Betting Open',
                                          gameStartTime: gameStartTime,
                                          gameEndTime: gameEndTime,
                                          winningNumbers:
                                              winningNumbersForCurrentDate,
                                          currentDate: formattedDate,
                                          winningPrice: winningPrice,
                                          // Other necessary parameters for open betting card
                                        );
                                      } else if (currentTime
                                              .isAfter(betClosingTime) &&
                                          currentTime.isBefore(gameEndTime)) {
                                        List<WinningNumbers>
                                            winningNumbersList = controller
                                                .winningNumbersList
                                                .map((numberString) {
                                          // Convert each string to a WinningNumbers object
                                          return WinningNumbers(
                                            date: DateTime
                                                .now(), // Set the date as needed
                                            winningNumbers: [
                                              numberString
                                            ], // Assuming each string represents one winning number
                                          );
                                        }).toList();

                                        final winningNumbersForCurrentDate =
                                            getWinningNumbersForCurrentDate(
                                                winningNumbersList);

                                        var now = DateTime.now();
                                        var formatter = DateFormat('dd/MM/yy');
                                        DateTime formattedDate =
                                            formatter.format(now) as DateTime;
                                        // Betting is closed
                                        return ClosedBetCardWidget(
                                          gameName: gameName,
                                          status: 'Betting Closed',
                                          gameStartTime: gameStartTime,
                                          gameEndTime: gameEndTime,
                                          winningNumbers:
                                              winningNumbersForCurrentDate,
                                          currentDate: formattedDate,
                                          // Other necessary parameters for closed betting card
                                        );
                                      } else if (currentTime
                                          .isAfter(gameEndTime)) {
                                        List<WinningNumbers>
                                            winningNumbersList = controller
                                                .winningNumbersList
                                                .map((numberString) {
                                          // Convert each string to a WinningNumbers object
                                          return WinningNumbers(
                                            date: DateTime
                                                .now(), // Set the date as needed
                                            winningNumbers: [
                                              numberString
                                            ], // Assuming each string represents one winning number
                                          );
                                        }).toList();

                                        final winningNumbersForCurrentDate =
                                            getWinningNumbersForCurrentDate(
                                                winningNumbersList);

                                        // Game has ended
                                        return ExpiredBetCardWidget(
                                          gameName: gameName,
                                          status: 'Game Ended',
                                          gameStartTime: gameStartTime,
                                          gameEndTime: gameEndTime,
                                          winningNumbers:
                                              winningNumbersForCurrentDate,
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

class WinningNumbers {
  final DateTime date;
  final List<String> winningNumbers;

  WinningNumbers({
    required this.date,
    required this.winningNumbers,
  });
}

List<String> getWinningNumbersForCurrentDate(
    List<WinningNumbers> winningNumbersList) {
  final currentDate = DateTime.now();
  final currentDateFormatted = DateFormat("yyyy-MM-dd").format(currentDate);

  final winningNumbersObject = winningNumbersList.firstWhere(
    (winningNumbers) =>
        DateFormat("yyyy-MM-dd").format(winningNumbers.date) ==
        currentDateFormatted,
    orElse: () => WinningNumbers(date: currentDate, winningNumbers: []),
  );

  return winningNumbersObject.winningNumbers;
}
