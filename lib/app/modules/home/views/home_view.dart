import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/config/theme/my_styles.dart';
import 'package:getx_skeleton/config/theme/my_theme.dart';
import 'package:iconly/iconly.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final logic = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
            backgroundColor: MyStyles.getContainerColor(
                isLightTheme: MyTheme().getThemeIsLight),
            currentIndex: logic.currentIndex.value,
            onTap: (int i) => logic.currentIndex(i),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: MyStyles.getPrimaryColor(
                isLightTheme: MyTheme().getThemeIsLight),
            unselectedItemColor: MyStyles.getSubtitleColor(
                isLightTheme: MyTheme().getThemeIsLight),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(IconlyBold.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(IconlyBold.game), label: 'Result'),
              BottomNavigationBarItem(
                  icon: Icon(IconlyBold.ticket), label: 'My Bet'),
              BottomNavigationBarItem(
                  icon: Icon(IconlyBold.document), label: 'News'),
              BottomNavigationBarItem(
                  icon: Icon(IconlyBold.profile), label: 'Profile'),
            ]);
      }),
      body: Obx(() => logic.widgetList.elementAt(logic.currentIndex.value)),
    );
  }
}
