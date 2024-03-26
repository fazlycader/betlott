// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/response/login_response_model.dart';
import 'package:getx_skeleton/app/modules/dashboard_screen/controllers/dashboard_screen_controller.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/constants.dart';
import '../../../components/custom_snackbar.dart';
import '../../../services/base_client.dart';
import '../../category_screen/controllers/category_screen_controller.dart';
import '../../my_bet_screen/controllers/my_bet_screen_controller.dart';
import '../../news_screen/controllers/news_screen_controller.dart';
import '../../profile_screen/controllers/profile_screen_controller.dart';

class LoginScreenController extends GetxController {
  //TODO: Implement LoginScreenController

  final count = 0.obs;
  RxBool isAccepted = false.obs;
  TextEditingController contact_number_Controller = TextEditingController();
  TextEditingController otp_Controller = TextEditingController();
  RxBool isLoading = false.obs;

  login() async {
    var data = {
      "contact_number": contact_number_Controller.text,
      "otp": otp_Controller.text
    };
    await BaseClient.safeApiCall(
      Constants.logInApiUrl, // url
      RequestType.post,
      data: data, // request type (get,post,delete,put)
      onLoading: () {
        isLoading.value = true;
      },
      onSuccess: (response) async {
        if (kDebugMode) {
          print("Test start");
        }
        if (kDebugMode) {
          print(LoginResponseModel.fromJson(response.data));
        }
        if (kDebugMode) {
          print("Test end");
        }
        // api done successfully
        isLoading.value = false;
        // await MySharedPref.setData(
        //     LoginResponseModel.fromJson(response.data).token ?? '', 'token');

        Get.put(DashboardScreenController());
        Get.put(CategoryScreenController());
        Get.put(MyBetScreenController());
        Get.put(NewsScreenController());
        Get.put(ProfileScreenController());
        Get.toNamed(Routes.HOME);
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        isLoading.value = false;

        // show error message to user
        CustomSnackBar.showCustomErrorToast(
            message: LoginResponseModel.fromJson(
                        jsonDecode(jsonEncode(error.response?.data)))
                    .message ??
                '');
        // CustomSnackBar.showCustomErrorToast(message: "Password does\'t match");
      },
    );
  }

  bool validate() {
    if (contact_number_Controller.text.isNotEmpty &&
        contact_number_Controller.text.length > 10) {
      return true;
    } else {
      if (contact_number_Controller.text.isEmptyOrNull) {
        CustomSnackBar.showCustomErrorToast(
            message: 'Contact Number Is Required');
      } else if (otp_Controller.text.isEmptyOrNull) {
        CustomSnackBar.showCustomErrorToast(
            message: 'Please Enter Your OTP Code');
      } else if (otp_Controller.text.length < 4) {
        CustomSnackBar.showCustomErrorToast(message: 'OTP is a 4 Digit Code');
      }
      return false;
    }
  }
}
