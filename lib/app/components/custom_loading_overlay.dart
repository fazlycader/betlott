import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/config/theme/my_theme.dart';
import 'package:logger/logger.dart';

import '../../config/theme/my_styles.dart';
import '../../config/translations/strings_enum.dart';

/// this method will show black overlay which look like dialog
/// and it will have loading animation inside of it
/// this will make sure user cant interact with ui until
/// any (async) method is executing cuz it will wait for async function
/// to end and then it will dismiss the overlay
showLoadingOverLay({
  required Future<dynamic> Function() asyncFunction,
  String? msg,
}) async {
  await Get.showOverlay(
    asyncFunction: () async {
      try {
        await Future.delayed(const Duration(seconds: 5));
        await asyncFunction();
      } catch (error) {
        Logger().e(error);
        Logger().e(StackTrace.current);
      }
    },
    loadingWidget: Center(
      child: getLoadingIndicator(msg: msg),
    ),
    opacity: 0.7,
    opacityColor: Colors.black,
  );
}

Widget getLoadingIndicator({String? msg}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 20.w,
      vertical: 20.h,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.r),
      color: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/app_icon.png',
          height: 45.h,
        ),
        SizedBox(
          width: 8.h,
        ),
        Text(msg ?? Strings.loading.tr, style: Get.theme.textTheme.bodyLarge),
      ],
    ),
  );
}
