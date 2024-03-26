import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/utils/custom_textfield_widget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../../utils/default_dialogue_widget.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../components/my_widgets_animator.dart';
import '../../../routes/app_pages.dart';
import '../controllers/bet_details_screen_controller.dart';

class UpComingBetDetailsScreenView extends GetView<UpComingBetDetailsScreenController> {
  const UpComingBetDetailsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpComingBetDetailsScreenController>(builder: (logic) {
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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              logic.match.questions?.first.question ?? '',
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
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        logic.match.imageUrlTeam1 ?? '',
                                        height: 60.0,
                                        width: 60.0,
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        logic.match.team1 ?? '',
                                        style:
                                            MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
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
                                        logic.match.cat?.name ?? '',
                                        textAlign: TextAlign.center,
                                        style:
                                            MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodyMedium,
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        logic.match.event?.name ?? '',
                                        textAlign: TextAlign.center,
                                        style:
                                            MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodyMedium,
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
                                                .difference(DateTime.parse(logic.match.endDate ?? ''))
                                                .inMinutes
                                                .toString(),
                                            style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        logic.match.imageUrlTeam2 ?? '',
                                        height: 60.0,
                                        width: 60.0,
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        logic.match.team2 ?? '',
                                        style:
                                            MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: logic.match.options?.length ?? 0,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                itemBuilder: (_, i) {
                                  return Obx(() {
                                    return GestureDetector(
                                      onTap: () {
                                        logic.selectOdds(
                                            logic.match.questions!.first.id!.toInt(),
                                            logic.match.options![i].id!.toInt(),
                                            logic.match.questions!.first.matchId!.toInt(),
                                            logic.match.options![i].ratio2.toDouble(),
                                            logic.match.options![i].optionName.toString(),
                                            logic.match.options![i].betLimit.toString());
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
                                            decoration: BoxDecoration(
                                                color: logic.optionId.value == logic.match.options![i].id
                                                    ? MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight)
                                                    : MyStyles.getSecondaryColor(
                                                        isLightTheme: MyTheme().getThemeIsLight),
                                                borderRadius: BorderRadius.circular(20.0)),
                                            child: Text(
                                              '1 x ${logic.match.options?[i].ratio2}',
                                              style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                                  .bodySmall,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          Text(
                                            logic.match.options?[i].optionName ?? '',
                                            style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                                .bodySmall,
                                          )
                                        ],
                                      ),
                                    );
                                  });
                                }),
                            // const SizedBox(
                            //   height: 10.0,
                            // ),
                            // const Divider(),
                            // const SizedBox(
                            //   height: 10.0,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   children: [
                            //     Row(
                            //       children: [
                            //         const Icon(
                            //           Icons.remove_red_eye_outlined,
                            //           size: 18.0,
                            //         ),
                            //         const SizedBox(
                            //           width: 4.0,
                            //         ),
                            //         Text(
                            //           '200',
                            //           style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                            //         ),
                            //       ],
                            //     ),
                            //     InkWell(
                            //       onTap: () => Get.toNamed(Routes.BET_COMMENT_SCREEN),
                            //       child: Row(
                            //         children: [
                            //           const Icon(
                            //             IconlyLight.chat,
                            //             size: 18.0,
                            //           ),
                            //           const SizedBox(
                            //             width: 4.0,
                            //           ),
                            //           Text(
                            //             '34',
                            //             style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     InkWell(
                            //       onTap: () => Get.toNamed(Routes.BET_PARTICIPANT_LIST_SCREEN),
                            //       child: Row(
                            //         children: [
                            //           const Icon(
                            //             IconlyLight.profile,
                            //             size: 18.0,
                            //           ),
                            //           const SizedBox(
                            //             width: 4.0,
                            //           ),
                            //           Text(
                            //             '30',
                            //             style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Bet Slip',
                          style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                        ),
                      ),
                      Obx(() {
                        return Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.all(20.0),
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
                                    logic.match.event?.name ?? '',
                                    style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                                  ),
                                  Icon(
                                    Icons.close,
                                    color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Match Result:',
                                    style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                                  ),
                                  Text(
                                    logic.selectedOptions.value,
                                    style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${logic.match.team1 ?? ''} - ${logic.match.team2 ?? ''}: (Odds)',
                                    style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                                  ),
                                  Text(
                                    '1 x ${logic.ratio.value}',
                                    style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                            ],
                          ),
                        ).visible(logic.showBetSlip.value);
                      }),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: CustomTextFieldWidget(
                            labelText: 'Enter Amount',
                            hintText: 'Enter Bet Amount',
                            textEditingController: logic.investAmountController,
                            textFieldType: TextFieldType.PHONE),
                      ),
                      Obx(() {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                              'Maximum ${logic.betLimit.value} USD Predict in this option',
                              style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                            ),
                          ),
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text(
                          'If you win (Return Amount 3.00 USD) %Charge Apply From This Amount ',
                          style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (logic.profile.user!.balance.toDouble() < logic.investAmountController.text.toDouble()) {
                              showCustomDialogue(
                                  title: 'So Sorry!',
                                  description: 'You do not have enough balance. Please make a deposit',
                                  icon: Icons.info_outline,
                                  onPressed: () {
                                    Get.toNamed(Routes.DEPOSIT_SCREEN);
                                  },
                                  buttonText: 'Deposit Now');
                            } else {
                              await logic.sendPrediction();
                            }
                          },
                          style:
                              MyStyles.getElevatedButtonTheme(isLightTheme: MyTheme().getThemeIsLight).style?.copyWith(
                                    textStyle: MyStyles.getElevatedButtonTextStyle(MyTheme().getThemeIsLight,
                                        isBold: false, fontSize: 16.sp),
                                  ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Predict Now'),
                            ],
                          ),
                        ),
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
