import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../controllers/terms_and_sconditions_screen_controller.dart';

class TermsAndSconditionsScreenView extends GetView<TermsAndSconditionsScreenController> {
  const TermsAndSconditionsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms And conditions '),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.back(),
          child: CircleAvatar(
            backgroundColor: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
            child: const Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'TermsAndSconditionsScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
