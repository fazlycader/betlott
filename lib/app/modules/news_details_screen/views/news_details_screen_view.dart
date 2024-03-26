import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../controllers/news_details_screen_controller.dart';

class NewsDetailsScreenView extends GetView<NewsDetailsScreenController> {
  NewsDetailsScreenView({Key? key}) : super(key: key);
  final logic = Get.find<NewsDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                      color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                      image: DecorationImage(image: NetworkImage(logic.news.value.imageUrl ?? ''), fit: BoxFit.fill)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: CircleAvatar(
                            backgroundColor: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                            radius: 20.0,
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        logic.news.value.title ?? '',
                        style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                                DateTimeFormat.format(DateTime.parse(logic.news.value.createdAt ?? ''),
                                    format: 'D, M j'),
                                style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        logic.news.value.description ?? '',
                        maxLines: 500,
                        style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
