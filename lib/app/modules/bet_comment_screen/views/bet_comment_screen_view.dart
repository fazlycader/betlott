import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../../utils/bet_comment_widget.dart';
import '../controllers/bet_comment_screen_controller.dart';

class BetCommentScreenView extends GetView<BetCommentScreenController> {
  const BetCommentScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              color: MyStyles.getScaffoldColor(isLightTheme: MyTheme().getThemeIsLight)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.CREATE_BET_COMMENT_SCREEN);
              },
              style: MyStyles.getElevatedButtonTheme(isLightTheme: MyTheme().getThemeIsLight).style?.copyWith(
                    textStyle:
                        MyStyles.getElevatedButtonTextStyle(MyTheme().getThemeIsLight, isBold: false, fontSize: 16.sp),
                  ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Write A Comment'),
                ],
              ),
            ),
          ),
        ),
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
                      'Comments',
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'Total 27 Comments',
                          style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, i) {
                        return const BetCommentWidget();
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
