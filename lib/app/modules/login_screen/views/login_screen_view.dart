import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_loading_overlay.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../../utils/custom_textfield_widget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  final logic = Get.find<LoginScreenController>();

  LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () => Get.back(),
                            child: CircleAvatar(
                              backgroundColor: MyStyles.getSecondaryColor(
                                  isLightTheme: MyTheme().getThemeIsLight),
                              child: const Icon(Icons.arrow_back),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Welcome back',
                            style: MyStyles.getTextTheme(
                                    isLightTheme: MyTheme().getThemeIsLight)
                                .headlineSmall,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Please enter your registered mobile number',
                            style: MyStyles.getTextTheme(
                                    isLightTheme: MyTheme().getThemeIsLight)
                                .titleMedium,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFieldWidget(
                            labelText: 'Mobile Number',
                            hintText: 'Enter your mobile number',
                            textEditingController:
                                logic.mobile_number_controller,
                            textFieldType: TextFieldType.PHONE,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (logic.validate()) {
                                Get.offAndToNamed(
                                    Routes.OTP_VERIFICATION_SCREEN);
                              }
                            },
                            style: MyStyles.getElevatedButtonTheme(
                                    isLightTheme: MyTheme().getThemeIsLight)
                                .style
                                ?.copyWith(
                                  textStyle:
                                      MyStyles.getElevatedButtonTextStyle(
                                          MyTheme().getThemeIsLight,
                                          isBold: false,
                                          fontSize: 16.sp),
                                ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Sign In'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: MyStyles.getTextTheme(
                                isLightTheme: MyTheme().getThemeIsLight)
                            .bodySmall,
                      ),
                      InkWell(
                        onTap: () => Get.toNamed(Routes.REGISTRATION_SCREEN),
                        child: Text(
                          'Sign Up',
                          style: MyStyles.getTextTheme(
                                  isLightTheme: MyTheme().getThemeIsLight)
                              .bodySmall!
                              .copyWith(
                                  color: MyStyles.getPrimaryColor(
                                      isLightTheme: MyTheme().getThemeIsLight)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Obx(() => logic.isLoading.value
              ? Center(child: getLoadingIndicator(msg: 'Logging In'))
              : Container())
        ],
      ),
    );
  }
}
