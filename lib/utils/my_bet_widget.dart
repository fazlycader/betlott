import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

import '../app/data/models/response/bet_log_model.dart';
import '../config/theme/my_styles.dart';
import '../config/theme/my_theme.dart';

class MyBetWidget extends StatelessWidget {
  const MyBetWidget({Key? key, required this.betLogModel, required this.index, required this.visible})
      : super(key: key);
  final BetLogModel betLogModel;
  final int index;
  final String visible;

  String betStatus(int status) {
    switch (status) {
      case 0:
        return "Pending";
      case 1:
        return "Won";
      case 2:
        return "Refunded";
      case -1:
        return "Lost";
      default:
        return "Pending";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible == betLogModel.logs![index].status! || visible == "3",
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  betLogModel.logs![index].betoption!.optionName!,
                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                ),
                Text(
                  DateTimeFormat.format(DateTime.parse(betLogModel.logs![index].createdAt!),
                      format: DateTimeFormats.american),
                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Match Result:',
                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                ),
                Text(
                  betStatus(int.parse(betLogModel.logs![index].status!)),
                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${betLogModel.logs?[index].match?.team1 ?? ''} - ${betLogModel.logs?[index].match?.team2 ?? ''}: (Odds)',
                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                ),
                Text(
                  betLogModel.logs![index].ratio!,
                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            const Divider(),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Stake',
                      style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      '\$${betLogModel.logs?[index].investAmount}',
                      style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodyMedium,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Return',
                      style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      '\$${betLogModel.logs?[index].returnAmount}',
                      style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodyMedium,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Result',
                      style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      betStatus(int.parse(betLogModel.logs![index].status!)),
                      style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                          .bodyMedium!
                          .copyWith(color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
