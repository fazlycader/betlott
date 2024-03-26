// ignore_for_file: empty_catches

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_snackbar.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

import '../../../../utils/default_dialogue_widget.dart';

class OtpVerificationScreenController extends GetxController {
  //TODO: Implement OtpVerificationScreenController

  RxBool isForgotPassword = false.obs;
  RxString timerText = '01:00'.obs; // Initial timer value
  late Timer _timer;
  int _countdown = 60; // Initial countdown value in seconds
  var isPinNotEmpty = false.obs;
  final TextEditingController pinController = TextEditingController();

  void setPinNotEmpty(bool value) {
    isPinNotEmpty.value = value;
  }

  void validatePinAndRoute(String enteredValue) {
    if (kDebugMode) {
      print(enteredValue);
    }
    if (enteredValue == "5678") {
      routingLogic();
      // Get.toNamed(Routes.DASHBOARD_SCREEN);
    } else {
      CustomSnackBar.showCustomErrorToast(
          message: 'Incorrect OTP :$enteredValue');
    }
  }

  @override
  void onInit() {
    try {
      isForgotPassword.value = Get.arguments[0];
    } catch (e) {}
    startTimer(); // Start the countdown timer
    super.onInit();
  }

  void resetTimer() {
    // Reset the countdown value and update the timer text
    _countdown = 60; // Reset to initial countdown value
    updateTimerText(); // Update the timer display
    startTimer(); // Start the timer again
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_countdown == 0) {
        timer.cancel(); // Stop the timer when countdown reaches zero
      } else {
        _countdown--; // Decrement the countdown
        updateTimerText(); // Update the timer display
      }
    });
  }

  void updateTimerText() {
    int minutes = _countdown ~/ 60;
    int seconds = _countdown % 60;
    timerText.value = '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    _timer.cancel(); // Cancel the timer when the controller is closed
    super.onClose();
  }

  void routingLogic() {
    isForgotPassword.value
        ? Get.toNamed(Routes.RESET_PASSWORD_SCREEN)
        : showCustomDialogue(
            title: 'Success!',
            description: '',
            icon: Icons.person,
            onPressed: () {
              Get.toNamed(Routes.HOME);
            },
            buttonText: 'Start Now');
  }
}
