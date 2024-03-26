import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardScreenController extends GetxController {
  Rx<PageController> pageController = PageController(initialPage: 0).obs;
  RxInt currentIndexPage = 0.obs;
  RxDouble percent = 0.34.obs;
}
