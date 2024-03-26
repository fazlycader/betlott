import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/default_dialogue_widget.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class ChangePasswordScreenController extends GetxController {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  ApiCallStatus apiCallStatus = ApiCallStatus.success;

  changePassword() async {
    String token = MySharedPref.getData('token') ?? '';
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.changePasswordApiUrl, // url
      RequestType.post, // request type (get,post,delete,put)
      headers: {'Authorization': 'Bearer $token'},
      data: {
        'password': newPasswordController.text,
        'password_confirmation': newPasswordController.text,
        'current_password': currentPasswordController.text
      },
      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
        showCustomDialogue(
            title: 'Success!',
            description: 'Your Password was successfully changed',
            icon: Icons.lock_open,
            onPressed: () {
              Get.toNamed(Routes.HOME);
            },
            buttonText: 'Go To Home');

        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }
}
