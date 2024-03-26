import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/response/news_list_model.dart';

import '../../../../utils/constants.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class NewsScreenController extends GetxController {
  //TODO: Implement NewsScreenController
  ApiCallStatus apiCallStatus = ApiCallStatus.success;
  NewsListModel data = NewsListModel();

  // getting data from api
  getData() async {
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.newsApiUrl, // url
      RequestType.get, // request type (get,post,delete,put)
      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully
        if (kDebugMode) {
          print(response.extra);
        }
        data = NewsListModel.fromJson(response.data);
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

  @override
  void onInit() {
    // getData();
    super.onInit();
  }
}
