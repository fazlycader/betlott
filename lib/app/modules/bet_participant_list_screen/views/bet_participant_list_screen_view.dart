import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/images/image_locations.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../controllers/bet_participant_list_screen_controller.dart';

class BetParticipantListScreenView extends GetView<BetParticipantListScreenController> {
  const BetParticipantListScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      'Participated',
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
                          'Total 80 Participated',
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
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                              radius: 25.0,
                              backgroundImage: AssetImage(ImageLocations.personImage),
                            ),
                            title: Text(
                              'Kristin Watson',
                              style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodyMedium,
                            ),
                            subtitle: Text(
                              '29 mins ago',
                              style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                            ),
                            trailing: Text(
                              '\$120',
                              style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight)
                                  .titleLarge!
                                  .copyWith(color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight)),
                            ),
                          ),
                        );
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
