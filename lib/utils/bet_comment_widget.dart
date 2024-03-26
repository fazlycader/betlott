import 'package:flutter/material.dart';

import '../config/images/image_locations.dart';
import '../config/theme/my_styles.dart';
import '../config/theme/my_theme.dart';

class BetCommentWidget extends StatelessWidget {
  const BetCommentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
      ),
      child: Column(
        children: [
          ListTile(
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.favorite_border),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  '7',
                  style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
                ),
              ],
            ),
          ),
          Text(
            'Tortor ultrices vel vulputate sollicitudin vitae. Nunc enim sapien integer facilisis.',
            style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).bodySmall,
          ),
        ],
      ),
    );
  }
}
