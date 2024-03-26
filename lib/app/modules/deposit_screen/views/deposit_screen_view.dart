// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/utils/custom_textfield_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../components/custom_snackbar.dart';
import '../../../components/my_widgets_animator.dart';
import '../controllers/deposit_screen_controller.dart';

class DepositScreenView extends GetView<DepositScreenController> {
  const DepositScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepositScreenController>(builder: (logic) {
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
                              'Deposit',
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
                                itemCount: logic.gateways.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20.0,
                                    crossAxisSpacing: 10.0,
                                    childAspectRatio: 1.5),
                                itemBuilder: (_, i) {
                                  return Obx(() => InkWell(
                                        onTap: () {
                                          logic.selectedIndex.value = i;
                                          if (kDebugMode) {
                                            print(i);
                                          }
                                          if (i > 2) {
                                            logic.isManual.value = true;
                                          } else {
                                            logic.isManual.value = false;
                                          }
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
                                              child: Image.network(logic.gateways[i].imageUrl ?? ""),
                                            ),
                                            Visibility(
                                              visible: logic.selectedIndex.value == i,
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
                      Obx(() => Visibility(
                            visible: logic.isManual.value,
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                              decoration: BoxDecoration(
                                  color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Account Details',
                                    style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                                  ),
                                  const Divider(),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    logic.gateways[logic.selectedIndex.value].accountDetais ?? "",
                                    style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Obx(() => Container(
                            padding: const EdgeInsets.all(20.0),
                            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                                color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amount To Deposit',
                                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                                ),
                                const Divider(),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                CustomTextFieldWidget(
                                    labelText: 'Enter Amount',
                                    hintText: 'Enter Deposit Amount',
                                    textEditingController: logic.amountController,
                                    textFieldType: TextFieldType.PHONE),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Visibility(
                                      visible: logic.isManual.value,
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(12.0),
                                                  ),
                                                  // ignore: sized_box_for_whitespace
                                                  child: Container(
                                                    height: 200.0,
                                                    width: MediaQuery.of(context).size.width - 80,
                                                    color: MyStyles.getContainerColor(
                                                        isLightTheme: MyTheme().getThemeIsLight),
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () async {
                                                              logic.pickedImage = await logic.picker
                                                                  .pickImage(source: ImageSource.gallery);
                                                              logic.imageFile.value = File(logic.pickedImage!.path);
                                                              logic.imagePath.value = logic.pickedImage!.path;
                                                              Future.delayed(const Duration(milliseconds: 100), () {
                                                                Navigator.pop(context);
                                                              });
                                                            },
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Icon(
                                                                  Icons.photo_library_rounded,
                                                                  size: 60.0,
                                                                  color: MyStyles.getPrimaryColor(
                                                                      isLightTheme: MyTheme().getThemeIsLight),
                                                                ),
                                                                Text(
                                                                  "Gallery",
                                                                  style: MyStyles.getTextTheme(
                                                                          isLightTheme: MyTheme().getThemeIsLight)
                                                                      .headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 40.0,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () async {
                                                              logic.pickedImage = await logic.picker
                                                                  .pickImage(source: ImageSource.camera);
                                                              logic.imageFile.value = File(logic.pickedImage!.path);
                                                              logic.imagePath.value = logic.pickedImage!.path;
                                                              Future.delayed(const Duration(milliseconds: 100), () {
                                                                Navigator.pop(context);
                                                              });
                                                            },
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Icon(
                                                                  Icons.camera,
                                                                  size: 60.0,
                                                                  color: MyStyles.getSubtitleColor(
                                                                      isLightTheme: MyTheme().getThemeIsLight),
                                                                ),
                                                                Text(
                                                                  "Camera",
                                                                  style: MyStyles.getTextTheme(
                                                                          isLightTheme: MyTheme().getThemeIsLight)
                                                                      .headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child: DottedBorderWidget(
                                            padding: const EdgeInsets.all(20.0),
                                            color: MyStyles.getContainerColor(isLightTheme: !MyTheme().getThemeIsLight),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.cloud_upload,
                                                  color: MyStyles.getContainerColor(
                                                      isLightTheme: !MyTheme().getThemeIsLight),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  "Upload Receipt Image",
                                                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    logic.imagePath == 'No Data'
                                        ? Container()
                                        : Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(image: FileImage(logic.imageFile.value))),
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (logic.selectedIndex.value == 1) {
                                        logic.handleStripePayment();
                                      } else if (logic.selectedIndex.value == 2) {
                                        logic.handleFlutterWavePayment();
                                      } else if (logic.selectedIndex.value == 0) {
                                        logic.handlePaypalPayment();
                                      } else {
                                        if (logic.isManual.value && logic.imagePath.value == "No Data") {
                                          CustomSnackBar.showCustomErrorToast(message: "Please Upload a Receipt");
                                        } else if (logic.isManual.value && logic.imagePath.value != "No Data") {
                                          logic.sendDeposit();
                                        } else {
                                          CustomSnackBar.showCustomErrorToast(message: "Unknown Error Occured");
                                        }
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
