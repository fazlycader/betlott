import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../../utils/custom_textfield_widget.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../components/custom_snackbar.dart';
import '../../../components/my_widgets_animator.dart';
import '../controllers/change_password_screen_controller.dart';

class ChangePasswordScreenView extends GetView<ChangePasswordScreenController> {
  const ChangePasswordScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordScreenController>(builder: (logic) {
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => Get.back(),
                              child: CircleAvatar(
                                backgroundColor: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                child: const Icon(Icons.arrow_back),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Change Password',
                              style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).headlineSmall,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Change password, it must be Strong password.',
                              style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleMedium,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            CustomTextFieldWidget(
                              labelText: 'Old Password',
                              hintText: 'Enter old password',
                              textEditingController: logic.currentPasswordController,
                              textFieldType: TextFieldType.PASSWORD,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            CustomTextFieldWidget(
                              labelText: 'Password',
                              hintText: 'Enter new password',
                              textEditingController: logic.newPasswordController,
                              textFieldType: TextFieldType.PASSWORD,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            CustomTextFieldWidget(
                              labelText: 'Confirm Password',
                              hintText: 'Enter the password again',
                              textEditingController: logic.confirmPasswordController,
                              textFieldType: TextFieldType.PASSWORD,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (logic.newPasswordController.text == logic.confirmPasswordController.text) {
                                  logic.changePassword();
                                } else {
                                  CustomSnackBar.showCustomErrorToast(message: "Password doesn't match");
                                }
                              },
                              style: MyStyles.getElevatedButtonTheme(isLightTheme: MyTheme().getThemeIsLight)
                                  .style
                                  ?.copyWith(
                                    textStyle: MyStyles.getElevatedButtonTextStyle(MyTheme().getThemeIsLight,
                                        isBold: false, fontSize: 16.sp),
                                  ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Continue'),
                                ],
                              ),
                            ),
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
