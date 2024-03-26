import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../../utils/custom_textfield_widget.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../components/custom_snackbar.dart';
import '../../../components/my_widgets_animator.dart';
import '../controllers/withdrawal_screen_controller.dart';

class WithdrawalScreenView extends GetView<WithdrawalScreenController> {
  const WithdrawalScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawalScreenController>(builder: (logic) {
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
                              'Withdraw',
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
                        margin: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select Payment Method',
                              style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                            ),
                            const Divider(),
                            GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: logic.withdrawMethodModel.gateways?.length ?? 0,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 20.0,
                                    crossAxisSpacing: 10.0,
                                    childAspectRatio: 1.5),
                                itemBuilder: (_, i) {
                                  return Obx(() => InkWell(
                                        onTap: () {
                                          logic.selectedIndex.value =
                                              logic.withdrawMethodModel.gateways?[i].id?.toInt() ?? 0;
                                        },
                                        child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                color:
                                                    MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              child:
                                                  Image.network(logic.withdrawMethodModel.gateways?[i].imageUrl ?? ""),
                                            ),
                                            Visibility(
                                              visible: logic.selectedIndex.value ==
                                                  logic.withdrawMethodModel.gateways?[i].id?.toInt(),
                                              child: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Icon(Icons.check_circle),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ));
                                })
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                            color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Amount To Withdraw',
                              style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFieldWidget(
                                labelText: 'Enter Amount',
                                hintText: 'Enter Withdraw Amount',
                                textEditingController: logic.amountController,
                                textFieldType: TextFieldType.PHONE),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFieldWidget(
                                labelText: 'Enter Account',
                                hintText: 'Enter Withdraw method account',
                                textEditingController: logic.accountController,
                                textFieldType: TextFieldType.NAME)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (logic.profileModel.user!.balance.toDouble() >
                                          logic.amountController.text.toDouble()) {
                                        logic.sendWithdraw();
                                      } else {
                                        CustomSnackBar.showCustomErrorToast(message: "Insufficient Balance");
                                      }
                                    },
                                    child: const Text('Continue'))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
