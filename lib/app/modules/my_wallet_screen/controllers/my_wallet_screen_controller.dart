import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/response/deposit_log.dart';

import '../../../../utils/constants.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../data/models/response/profile_model.dart';
import '../../../data/models/response/transaction_log_model.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class MyWalletScreenController extends GetxController {
  DepositLog depositLog = DepositLog();
  TransactionLogModel transactionLogModel = TransactionLogModel();
  ApiCallStatus apiCallStatus = ApiCallStatus.loading;
  ProfileModel profile = ProfileModel();
  RxString totalDeposit = "".obs;

  @override
  void onInit() {
    getProfile();
    getDeposits();
    getTransactions();
    super.onInit();
  }

  getDeposits() async {
    String token = MySharedPref.getData('token') ?? '';
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.depositLogApiUrl, // url
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
        double total = 0.0;
        // api done successfully
        depositLog = DepositLog.fromJson(response.data);
        depositLog.deposits?.forEach((element) {
          total = total + double.parse(element.amount!);
        });
        totalDeposit.value = total.toString();
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

  getTransactions() async {
    String token = MySharedPref.getData('token') ?? '';
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.transactionLogApiUrl, // url
      RequestType.get, // request type (get,post,delete,put)
      headers: {'Authorization': 'Bearer $token'},
      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully
        transactionLogModel = TransactionLogModel.fromJson(response.data);
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
