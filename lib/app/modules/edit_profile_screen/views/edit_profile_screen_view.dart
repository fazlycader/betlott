// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../../utils/custom_textfield_widget.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../components/my_widgets_animator.dart';
import '../controllers/edit_profile_screen_controller.dart';

class EditProfileScreenView extends GetView<EditProfileScreenController> {
  const EditProfileScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileScreenController>(builder: (logic) {
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
                                    backgroundColor:
                                        MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                    child: const Icon(Icons.arrow_back),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Update Profile',
                                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).headlineSmall,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Let’s update your profile with more information',
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
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
                                              color:
                                                  MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () async {
                                                        logic.pickedImage =
                                                            await logic.picker.pickImage(source: ImageSource.gallery);
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
                                                        logic.pickedImage =
                                                            await logic.picker.pickImage(source: ImageSource.camera);
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
                                  child: Stack(
                                    children: [
                                      Obx(() => Container(
                                            height: 120,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black54, width: 1),
                                              borderRadius: const BorderRadius.all(Radius.circular(120)),
                                              image: logic.imagePath == 'No Data'
                                                  ? DecorationImage(
                                                      image: NetworkImage(logic.profilePicture),
                                                      fit: BoxFit.cover,
                                                    )
                                                  : DecorationImage(
                                                      image: FileImage(logic.imageFile.value),
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                          )),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white, width: 2),
                                            borderRadius: const BorderRadius.all(Radius.circular(120)),
                                            color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                          ),
                                          child: const Icon(
                                            Icons.camera_alt_outlined,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
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
                                  labelText: 'Mobile',
                                  hintText: 'Enter Your mobile Number',
                                  textEditingController: logic.mobileController,
                                  textFieldType: TextFieldType.PASSWORD,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                CustomTextFieldWidget(
                                  labelText: 'Address',
                                  hintText: 'Enter your address',
                                  textEditingController: logic.addressController,
                                  textFieldType: TextFieldType.PASSWORD,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                CustomTextFieldWidget(
                                  labelText: 'City',
                                  hintText: 'Enter your city name',
                                  textEditingController: logic.cityController,
                                  textFieldType: TextFieldType.NAME,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                CustomTextFieldWidget(
                                  labelText: 'Country',
                                  hintText: 'Enter your Country name',
                                  textEditingController: logic.countryController,
                                  textFieldType: TextFieldType.NAME,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    logic.updateProfile();
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
                                      Text('Update'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}
