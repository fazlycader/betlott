import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_skeleton/config/theme/my_styles.dart';
import 'package:getx_skeleton/config/theme/my_theme.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/timer_controller.dart';
import 'package:getx_skeleton/app/data/models/response/category_match_model.dart'
    as cat;
import 'package:getx_skeleton/app/modules/dashboard_screen/controllers/dashboard_screen_controller.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';
import 'package:http/http.dart' as http;

import '../config/theme/my_styles.dart';
import '../config/theme/my_theme.dart';
import 'package:intl/intl.dart';

class ActiveBetCardWidget extends StatelessWidget {
  final String gameName;
  final String status;
  final DateTime gameStartTime;
  final DateTime gameEndTime;
  final List<String>? winningNumbers;
  final DateTime currentDate;
  final String winningPrice;

  final TimerController timerController = Get.put(TimerController());

   ActiveBetCardWidget({
    Key? key,
    required this.gameName,
    required this.status,
    required this.gameStartTime,
    required this.gameEndTime,
    required this.winningNumbers,
    required this.currentDate,
    required this.winningPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color:
            MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  gameName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontSize: 14),
                ),
                Text(
                  gameStartTime as String,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 10),
                Text(
                   currentDate as String,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                    timerController.durationString.value,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.BET_DETAILS_SCREEN),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                    child: Text(
                      'PLAY',
                      style: MyStyles.getTextTheme(
                              isLightTheme: MyTheme().getThemeIsLight)
                          .bodyLarge,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                // Image.asset(
                //   'assets/images/dear_logo.png',
                //   height: 30.0,
                // ),
                const SizedBox(height: 10),
                Text(
                  gameEndTime as String,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 10),
                Text(
                  winningPrice,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontSize: 14),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClosedBetCardWidget extends StatelessWidget {
  final String gameName;
  final String status;
  final DateTime gameStartTime;
  final DateTime gameEndTime;
  final List<String>? winningNumbers;
  final DateTime currentDate;

  const ClosedBetCardWidget({
    Key? key,
    required this.gameName,
    required this.status,
    required this.gameStartTime,
    required this.gameEndTime,
    required this.winningNumbers,
    required this.currentDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: LightThemeColors.lightRedColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  gameName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 10),
                Text(
                  currentDate as String,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Booking Closed",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontSize: 14, color: Colors.red),
                ),
                const SizedBox(height: 10),
                Text(
                  "Result In",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  // timerController.durationString.value,
                  "00 : 02 : 54",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 14),
                ),
                // Obx(
                //   () => Text(
                //     // timerController.durationString.value,
                //     "00 : 02 : 54",
                //     style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExpiredBetCardWidget extends StatelessWidget {
  final String gameName;
  final String status;
  final DateTime gameStartTime;
  final DateTime gameEndTime;
  final List<String>? winningNumbers;

  const ExpiredBetCardWidget({
    Key? key,
    required this.gameName,
    required this.status,
    required this.gameStartTime,
    required this.gameEndTime,
    required this.winningNumbers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: LightThemeColors.lightGreenColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  gameName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontSize: 14),
                ),
                Text(
                  DateFormat("HH:mm:ss").format(gameStartTime),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 10),
                Text(
                  DateFormat("HH:mm:ss").format(gameEndTime),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Winning Number",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontSize: 14, color: Colors.green),
                ),
                const SizedBox(height: 10),
                // Display winning numbers if available, otherwise show a message
                winningNumbers!.isNotEmpty
                    ? Row(
                        children: winningNumbers!
                            .map((number) => WonDigit(number: number))
                            .toList(),
                      )
                    : const Text(
                        "Winning numbers hasn't updated",
                        style: TextStyle(color: Colors.red),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WonDigit extends StatelessWidget {
  final String number;

  const WonDigit({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0.7),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        number,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12),
      ),
    );
  }
}

class CategoryBetCardWidget extends StatelessWidget {
  const CategoryBetCardWidget(
      {Key? key, required this.matches, required this.isVisible})
      : super(key: key);
  final cat.Matches matches;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: MyStyles.getContainerColor(
              isLightTheme: MyTheme().getThemeIsLight),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Image.network(
                    matches.imageUrlTeam1 ?? '',
                    height: 60.0,
                    width: 60.0,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    matches.team1 ?? '',
                    style: MyStyles.getTextTheme(
                            isLightTheme: MyTheme().getThemeIsLight)
                        .titleLarge,
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    matches.cat?.name ?? '',
                    textAlign: TextAlign.center,
                    style: MyStyles.getTextTheme(
                            isLightTheme: MyTheme().getThemeIsLight)
                        .headlineSmall,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    matches.event?.name ?? '',
                    textAlign: TextAlign.center,
                    style: MyStyles.getTextTheme(
                            isLightTheme: MyTheme().getThemeIsLight)
                        .bodyMedium,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.redAccent,
                        size: 18.0,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        DateTime.now()
                            .difference(DateTime.parse(matches.endDate ?? ''))
                            .inMinutes
                            .toString(),
                        style: MyStyles.getTextTheme(
                                isLightTheme: MyTheme().getThemeIsLight)
                            .bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  ElevatedButton(
                    onPressed: () => Get.toNamed(
                        Routes.CATEGORY_BET_DETAILS_SCREEN,
                        arguments: [matches]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                      child: Text(
                        'Bet Now',
                        style: MyStyles.getTextTheme(
                                isLightTheme: MyTheme().getThemeIsLight)
                            .bodyLarge,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image.network(
                    matches.imageUrlTeam2 ?? '',
                    height: 60.0,
                    width: 60.0,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    matches.team2 ?? '',
                    style: MyStyles.getTextTheme(
                            isLightTheme: MyTheme().getThemeIsLight)
                        .titleLarge,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
