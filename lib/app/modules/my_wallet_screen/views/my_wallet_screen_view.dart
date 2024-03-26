import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../components/my_widgets_animator.dart';
import '../controllers/my_wallet_screen_controller.dart';

class MyWalletScreenView extends GetView<MyWalletScreenController> {
  const MyWalletScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyWalletScreenController>(builder: (logic) {
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
                              'My Wallet',
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
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.all(30.0),
                        decoration: BoxDecoration(
                          color: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Deposit Balance',
                                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight)),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  '\$${logic.totalDeposit.value}',
                                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                      .bodyLarge!
                                      .copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),
                                )
                              ],
                            ),
                            Container(
                              width: 2.0,
                              height: 80.0,
                              color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Current Balance',
                                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight)),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  '\$${logic.profile.user?.balance}',
                                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                      .bodyLarge!
                                      .copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                              onPressed: () => Get.toNamed(Routes.DEPOSIT_SCREEN),
                              style: MyStyles.getElevatedButtonTheme(isLightTheme: MyTheme().getThemeIsLight).style,
                              child: const Text('Deposit'),
                            )),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                                child: ElevatedButton(
                              onPressed: () => Get.toNamed(Routes.WITHDRAWAL_SCREEN, arguments: [logic.profile]),
                              style: MyStyles.getElevatedButtonTheme(isLightTheme: MyTheme().getThemeIsLight)
                                  .style!
                                  .merge(
                                    ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      side: BorderSide(
                                        color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                      ),
                                    ),
                                  )
                                  .copyWith(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                  ),
                              child: const Text('Withdraw'),
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                          borderRadius:
                              const BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'All Transactions',
                              style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                          itemCount: logic.transactionLogModel.trans?.data?.length ?? 0,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_, i) {
                            return Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                  color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                                  border: Border(
                                      bottom: BorderSide(
                                          color: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight)))),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                  child: Transform.rotate(angle: 0.4, child: const Icon(Icons.arrow_forward)),
                                ),
                                title: Text(
                                  logic.transactionLogModel.trans?.data?[i].description ?? "",
                                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodyLarge,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'T. ID: ${logic.transactionLogModel.trans?.data?[i].trx}',
                                      style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                                    ),
                                    Text(
                                      DateTimeFormat.format(
                                          DateTime.parse(logic.transactionLogModel.trans?.data?[i].createdAt ?? ''),
                                          format: AmericanDateFormats.dayOfWeek),
                                      style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                                    ),
                                  ],
                                ),
                                trailing: Text(
                                  '\$${logic.transactionLogModel.trans?.data?[i].amount}',
                                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                      .bodyMedium!
                                      .copyWith(
                                          color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight)),
                                ),
                              ),
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
