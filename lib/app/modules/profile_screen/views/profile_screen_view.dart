import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_snackbar.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:iconly/iconly.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../components/my_widgets_animator.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  const ProfileScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (logic) {
      final homeLogic = Get.find<HomeController>();
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
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                          ),
                          color: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                        ),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () => homeLogic.currentIndex(0),
                                    child: CircleAvatar(
                                      backgroundColor:
                                          MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                      radius: 20.0,
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Profile',
                                    style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                                  ),
                                  CircleAvatar(
                                    backgroundColor:
                                        MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                    radius: 20.0,
                                    child: IconTheme(
                                      data: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight),
                                      child: const Icon(Icons.search),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(logic.profile.user?.imageUrl ?? ''),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        logic.profile.user?.name ?? '',
                                        style:
                                            MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                                      ),
                                      Text(
                                        logic.profile.user?.email ?? '',
                                        style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: Get.width,
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                ),
                                color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '06',
                                        style:
                                            MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                                      ),
                                      Text(
                                        'Total Game',
                                        style:
                                            MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodyMedium,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '20',
                                        style:
                                            MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                                      ),
                                      Text(
                                        'Total Wins',
                                        style:
                                            MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodyMedium,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '43',
                                        style:
                                            MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                                      ),
                                      Text(
                                        'Total Loses',
                                        style:
                                            MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodyMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ).visible(false),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListTile(
                          onTap: () => Get.toNamed(Routes.EDIT_PROFILE_SCREEN),
                          leading: Icon(
                            IconlyBold.profile,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                          title: Text(
                            'My Profile',
                            style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge!.copyWith(
                                color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                                fontWeight: FontWeight.normal),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListTile(
                          onTap: () => Get.toNamed(Routes.MY_WALLET_SCREEN),
                          leading: Icon(
                            IconlyBold.wallet,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                          title: Text(
                            'Wallet',
                            style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge!.copyWith(
                                color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                                fontWeight: FontWeight.normal),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListTile(
                          onTap: () => Get.toNamed(Routes.CHANGE_THEME_SCREEN),
                          leading: Icon(
                            Icons.light_mode,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                          title: Text(
                            'Change Theme',
                            style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge!.copyWith(
                                color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                                fontWeight: FontWeight.normal),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListTile(
                          leading: Icon(
                            IconlyBold.notification,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                          title: Text(
                            'Push Notification',
                            style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge!.copyWith(
                                color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                                fontWeight: FontWeight.normal),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                        ),
                      ).visible(false),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListTile(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(text: logic.profile.user?.referralToken ?? ''));
                            CustomSnackBar.showCustomSnackBar(
                                title: "Referral Code Copies", message: "Referral code copies successfully");
                          },
                          leading: Icon(
                            IconlyBold.user_3,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                          title: Text(
                            'Copy Refer Code',
                            style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge!.copyWith(
                                color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                                fontWeight: FontWeight.normal),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListTile(
                          onTap: () => Get.toNamed(Routes.CHANGE_PASSWORD_SCREEN),
                          leading: Icon(
                            IconlyBold.unlock,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                          title: Text(
                            'Change Password',
                            style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge!.copyWith(
                                color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                                fontWeight: FontWeight.normal),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListTile(
                          leading: Icon(
                            IconlyBold.danger,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                          title: Text(
                            'Terms & Conditions',
                            style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge!.copyWith(
                                color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                                fontWeight: FontWeight.normal),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                        ),
                      ).visible(false),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListTile(
                          leading: Icon(
                            IconlyBold.logout,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                          title: Text(
                            'Log Out',
                            style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge!.copyWith(
                                color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                                fontWeight: FontWeight.normal),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
