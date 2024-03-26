import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../components/my_widgets_animator.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/news_screen_controller.dart';

class NewsScreenView extends GetView<NewsScreenController> {
  const NewsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsScreenController>(builder: (logic) {
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
                              onTap: () => homeLogic.currentIndex(0),
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
                              'News',
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
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 10.0,
                                childAspectRatio: 0.7),
                            itemCount: logic.data.news?.length ?? 0,
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: () =>
                                    Get.toNamed(Routes.NEWS_DETAILS_SCREEN, arguments: [logic.data.news![index]]),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 120.0,
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0),
                                            ),
                                            image: DecorationImage(
                                                image: NetworkImage(logic.data.news?[index].imageUrl ?? ''),
                                                fit: BoxFit.fill)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.access_time_filled,
                                              color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                              size: 18.0,
                                            ),
                                            const SizedBox(
                                              width: 6.0,
                                            ),
                                            Text(
                                              DateTimeFormat.format(
                                                  DateTime.parse(logic.data.news?[index].createdAt ?? ''),
                                                  format: 'D, M j'),
                                              style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                                  .bodySmall,
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          logic.data.news?[index].title ?? '',
                                          style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                              .titleMedium,
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.all(4.0),
                                      //   child: Row(
                                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //     children: [
                                      //       Row(
                                      //         children: [
                                      //           Icon(
                                      //             Icons.mode_comment_outlined,
                                      //             size: 18.0,
                                      //             color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                                      //           ),
                                      //           const SizedBox(
                                      //             width: 4.0,
                                      //           ),
                                      //           Text(
                                      //             '27',
                                      //             style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                                      //           )
                                      //         ],
                                      //       ),
                                      //       Row(
                                      //         children: [
                                      //           Icon(
                                      //             Icons.thumb_up_off_alt,
                                      //             size: 18.0,
                                      //             color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                                      //           ),
                                      //           const SizedBox(
                                      //             width: 4.0,
                                      //           ),
                                      //           Text(
                                      //             '50',
                                      //             style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                                      //           )
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
