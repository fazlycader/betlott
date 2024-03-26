import 'package:get/get.dart';
import 'package:getx_skeleton/config/theme/my_theme.dart';

class ChangeThemeScreenController extends GetxController {
  //TODO: Implement ChangeThemeScreenController

  final count = 0.obs;
  final RxBool isLight = false.obs;

  @override
  void onInit() {
    super.onInit();
    isLight.value = MyTheme().getThemeIsLight;
  }

  void increment() => count.value++;
}
