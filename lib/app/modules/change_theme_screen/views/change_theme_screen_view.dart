// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:getx_skeleton/config/theme/my_styles.dart';

import '../../../../config/theme/my_theme.dart';
import '../controllers/change_theme_screen_controller.dart';

class ChangeThemeScreenView extends GetView<ChangeThemeScreenController> {
  ChangeThemeScreenView({Key? key}) : super(key: key);
  final logic = Get.find<ChangeThemeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => await Get.toNamed(Routes.HOME),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Change Theme'),
            leading: InkWell(onTap: () => Get.toNamed(Routes.HOME), child: const Icon(Icons.arrow_back)),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: IconTheme(
                    data: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight),
                    child: const Icon(Icons.light_mode),
                  ),
                  title: Text(
                    'Light Theme',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  trailing: Obx(() {
                    return Switch(
                      onChanged: (val) {
                        logic.isLight.value = val;
                        MyTheme.changeTheme();
                      },
                      value: logic.isLight.value,
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
