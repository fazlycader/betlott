import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../../utils/custom_textfield_widget.dart';
import '../../../../utils/default_dialogue_widget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/reset_password_screen_controller.dart';

class ResetPasswordScreenView extends GetView<ResetPasswordScreenController> {
  const ResetPasswordScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                    'Set New Password',
                    style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).headlineSmall,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Create new password, it must be Strong password.',
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
                    labelText: 'Password',
                    hintText: 'Enter new password',
                    textEditingController: TextEditingController(),
                    textFieldType: TextFieldType.PASSWORD,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextFieldWidget(
                    labelText: 'Confirm Password',
                    hintText: 'Enter the password again',
                    textEditingController: TextEditingController(),
                    textFieldType: TextFieldType.PASSWORD,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showCustomDialogue(
                          title: 'Success!',
                          description: 'Your Password was successfully changed',
                          icon: Icons.lock_open,
                          onPressed: () {
                            Get.toNamed(Routes.LOGIN_SCREEN);
                          },
                          buttonText: 'Log in Again');
                    },
                    style: MyStyles.getElevatedButtonTheme(isLightTheme: MyTheme().getThemeIsLight).style?.copyWith(
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
    );
  }
}
