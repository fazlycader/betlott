import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/response/home_screen_model.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/default_dialogue_widget.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../data/models/response/profile_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class UpComingBetDetailsScreenController extends GetxController {
  UpComMatche match = UpComMatche();
  ApiCallStatus apiCallStatus = ApiCallStatus.success;
  var optionId = 0.obs;
  var questionId = 0.obs;
  var matchId = 0.obs;
  var selectedOptions = ''.obs;
  var betLimit = ''.obs;
  TextEditingController investAmountController = TextEditingController();
  RxBool showBetSlip = false.obs;
  var ratio = 0.0.obs;
  ProfileModel profile = ProfileModel();

  @override
  void onInit() {
    match = Get.arguments[0];
    getProfile();
    if (kDebugMode) {
      print("tyujyg");
    }
    super.onInit();
  }

  selectOdds(int questionid, int optionid, int matchid, double ratio2, String selected, String limit) {
    optionId.value = optionid;
    questionId.value = questionid;
    matchId.value = matchid;
    ratio.value = ratio2;
    showBetSlip.value = true;
    selectedOptions.value = selected;
    betLimit.value = limit;
  }

  sendPrediction() async {
    String token = MySharedPref.getData('token') ?? '';
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.predictionApiUrl, // url
      RequestType.post, // request type (get,post,delete,put)
      headers: {'Authorization': 'Bearer $token'},
      data: {
        'invest_amount': investAmountController.text,
        'betoption_id': optionId.value,
        'match_id': matchId.value,
        'betquestion_id': questionId.value,
        'return_amount': int.parse(investAmountController.text) * ratio.value
      },
      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully
        showCustomDialogue(
            title: 'Congratulations!',
            description: 'Your bet has been placed successfully',
            icon: Icons.check_circle,
            onPressed: () {
              Get.toNamed(Routes.HOME);
            },
            buttonText: 'Back to Home');
        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
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

  getProfile() async {
    String token = MySharedPref.getData('token') ?? '';
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.profileApiUrl, // url
      RequestType.get, // request type (get,post,delete,put)
      headers: {'Authorization': 'Bearer $token'},
      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully
        profile = ProfileModel.fromJson(response.data);
        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
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
