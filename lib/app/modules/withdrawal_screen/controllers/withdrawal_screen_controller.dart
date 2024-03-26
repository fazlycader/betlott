import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/response/profile_model.dart';
import 'package:getx_skeleton/app/data/models/response/withdraw_method_model.dart';

import '../../../../utils/constants.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';
import '../../dashboard_screen/controllers/dashboard_screen_controller.dart';
import '../../my_wallet_screen/controllers/my_wallet_screen_controller.dart';

class WithdrawalScreenController extends GetxController {
  WithdrawMethodModel withdrawMethodModel = WithdrawMethodModel();
  ApiCallStatus apiCallStatus = ApiCallStatus.loading;
  var selectedIndex = 0.obs;
  TextEditingController amountController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  ProfileModel profileModel = ProfileModel();

  @override
  void onInit() {
    getGateways();
    profileModel = Get.arguments[0];
    super.onInit();
  }

  getGateways() async {
    String token = MySharedPref.getData('token') ?? '';
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.withdrawMethodApiUrl, // url
      RequestType.get, // request type (get,post,delete,put)
      headers: {'Authorization': 'Bearer $token'},
      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        if (kDebugMode) {
          print(token);
        }
        // api done successfully
        withdrawMethodModel = WithdrawMethodModel.fromJson(response.data);
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

  sendWithdraw() async {
    String token = MySharedPref.getData('token') ?? '';
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.withdrawPostApiUrl, // url
      RequestType.post, // request type (get,post,delete,put)
      headers: {'Authorization': 'Bearer $token'},
      data: {
        'amount': amountController.text,
        'method_id': selectedIndex.value.toString(),
        'detail': accountController.text
      },
      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) async {
        selectedIndex.value = 0;
        amountController.clear();
        accountController.clear();
        // api done successfully
        final homeLogic = Get.find<DashboardScreenController>();
        final walletLogic = Get.find<MyWalletScreenController>();
        await homeLogic.getProfile();
        await walletLogic.getDeposits();
        await walletLogic.getTransactions();
        Get.toNamed(Routes.HOME);
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
