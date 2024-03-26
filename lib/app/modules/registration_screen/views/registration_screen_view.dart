import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/images/image_locations.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../../utils/custom_textfield_widget.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../routes/app_pages.dart';
import '../controllers/registration_screen_controller.dart';

class RegistrationScreenView extends GetView<RegistrationScreenController> {
  final logic = Get.find<RegistrationScreenController>();

  RegistrationScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
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
                          'Create an Account',
                          style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).headlineSmall,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Let’s us know what your name, email, and your password',
                          style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleMedium,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextFieldWidget(
                          labelText: 'Full Name',
                          hintText: 'Enter your full name',
                          textEditingController: logic.nameController,
                          textFieldType: TextFieldType.NAME,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomTextFieldWidget(
                          labelText: 'Email Address',
                          hintText: 'Enter your email address',
                          textEditingController: logic.emailController,
                          textFieldType: TextFieldType.EMAIL,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomTextFieldWidget(
                          labelText: 'Password',
                          hintText: 'Enter new password',
                          textEditingController: logic.passwordController,
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
                        CustomTextFieldWidget(
                          labelText: 'Refer code (Optional)',
                          hintText: 'Enter your refer code',
                          textEditingController: TextEditingController(),
                          textFieldType: TextFieldType.NAME,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Obx(
                          () => Row(
                            children: [
                              Checkbox(
                                  value: logic.isAccepted.value,
                                  onChanged: (bool? val) {
                                    logic.isAccepted(val!);
                                  }),
                              Text(
                                'I agree to the ',
                                style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                              ),
                              Text(
                                'Terms & Conditions',
                                style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                    .bodySmall!
                                    .copyWith(color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (logic.validate()) {
                              logic.signUp();
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
                              Text('Sign Up'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.0, right: 4.0),
                              child: Text('or Sign up with'),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Center(
                            child: Image(
                          image: AssetImage(
                            ImageLocations.socialLogin,
                          ),
                          width: 130.sp,
                          height: 35.sp,
                        )),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                            ),
                            InkWell(
                              onTap: () => Get.toNamed(Routes.LOGIN_SCREEN),
                              child: Text(
                                'Sign In',
                                style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                    .bodySmall!
                                    .copyWith(color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Obx(() => logic.isLoading.value ? Center(child: getLoadingIndicator(msg: 'Signing Up')) : Container())
          ],
        ),
      ),
    );
  }
}
