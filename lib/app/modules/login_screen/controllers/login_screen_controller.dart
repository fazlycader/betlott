// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/response/login_response_model.dart';
import 'package:getx_skeleton/app/modules/dashboard_screen/controllers/dashboard_screen_controller.dart';
import 'package:getx_skeleton/app/modules/result_screen/controllers/result_screen_controller.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

import '../../../../utils/constants.dart';
import '../../../components/custom_snackbar.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../services/base_client.dart';
import '../../my_bet_screen/controllers/my_bet_screen_controller.dart';
import '../../news_screen/controllers/news_screen_controller.dart';
import '../../profile_screen/controllers/profile_screen_controller.dart';

class LoginScreenController extends GetxController {
  //TODO: Implement LoginScreenController

  final count = 0.obs;
  RxBool isAccepted = false.obs;
  TextEditingController mobile_number_controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  login() async {
    var data = {
      "email": mobile_number_controller.text,
      "password": passwordController.text
    };
    await BaseClient.safeApiCall(
      Constants.logInApiUrl, // url
      RequestType.post,
      data: data, // request type (get,post,delete,put)
      onLoading: () {
        isLoading.value = true;
      },
      onSuccess: (response) async {
        // api done successfully
        isLoading.value = false;
        await MySharedPref.setData(
            LoginResponseModel.fromJson(response.data).token ?? '', 'token');

        Get.put(DashboardScreenController());
        Get.put(ResultScreenController());
        Get.put(MyBetScreenController());
        Get.put(NewsScreenController());
        Get.put(ProfileScreenController());
        Get.toNamed(Routes.HOME);
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        isLoading.value = false;
        Get.put(DashboardScreenController());
        Get.put(ResultScreenController());
        Get.put(MyBetScreenController());
        Get.put(NewsScreenController());
        Get.put(ProfileScreenController());
        Get.toNamed(Routes.HOME);
        // show error message to user
        CustomSnackBar.showCustomErrorToast(
            message: LoginResponseModel.fromJson(
                        jsonDecode(jsonEncode(error.response!.data)))
                    .message ??
                '');
      },
    );
  }

  bool validate() {
    if (mobile_number_controller.text.length != 10) {
      if (mobile_number_controller.text.isEmpty) {
        CustomSnackBar.showCustomErrorToast(
            message: 'Contact Number is required');
      } else {
        CustomSnackBar.showCustomErrorToast(
            message: 'Contact Number should be 10 digits');
      }
      return false;
    } else {
      return true;
    }
  }
}
