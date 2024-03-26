import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/response/bet_log_model.dart';

import '../../../../utils/constants.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class MyBetScreenController extends GetxController {
  //TODO: Implement MyBetScreenController

  ApiCallStatus apiCallStatus = ApiCallStatus.success;
  BetLogModel betLogModel = BetLogModel();

  @override
  void onInit() {
    // getBets();
    super.onInit();
  }

  getBets() async {
    String token = MySharedPref.getData('token') ?? '';
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.betLogApiUrl, // url
      RequestType.get, // request type (get,post,delete,put)
      headers: {'Authorization': 'Bearer $token'},
      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully
        betLogModel = BetLogModel.fromJson(response.data);
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
