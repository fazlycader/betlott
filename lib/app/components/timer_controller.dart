import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController with GetTickerProviderStateMixin {
  var durationString = "".obs;
  var initialSeconds = 3600;

  @override
  void onInit() {
    initializeTimer();
    super.onInit();
  }

  initializeTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (initialSeconds == 0) {
        timer.cancel();
      } else {
        updateDuration(initialSeconds - timer.tick);
      }
    });
  }

  updateDuration(int seconds) {
    var duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String sDuration = "${twoDigits(duration.inHours)} : "
        "${twoDigits(duration.inMinutes.remainder(10))} : "
        "${twoDigits(duration.inSeconds.remainder(10))}";
    durationString.value = sDuration;
    update();
  }
}
