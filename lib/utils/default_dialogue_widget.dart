import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/theme/my_styles.dart';
import '../config/theme/my_theme.dart';

void showCustomDialogue({
  required String title,
  required String description,
  required IconData icon,
  required var onPressed,
  required String buttonText,
}) {
  Get.defaultDialog(
    title: '',
    titlePadding: EdgeInsets.zero,
    contentPadding: const EdgeInsets.all(20.0),
    radius: 10.0,
    backgroundColor: MyStyles.getScaffoldColor(isLightTheme: MyTheme().getThemeIsLight),
    content: Column(
      children: [
        CircleAvatar(
          backgroundColor: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
          radius: 50.0,
          child: Icon(
            icon,
            color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight),
            size: 45.0,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          title,
          style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            description,
            style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                .bodyMedium!
                .copyWith(color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight)),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: MyStyles.getElevatedButtonTheme(isLightTheme: MyTheme().getThemeIsLight).style?.copyWith(
                textStyle:
                    MyStyles.getElevatedButtonTextStyle(MyTheme().getThemeIsLight, isBold: false, fontSize: 16.sp),
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(buttonText),
            ],
          ),
        ),
      ],
    ),
  );
}
