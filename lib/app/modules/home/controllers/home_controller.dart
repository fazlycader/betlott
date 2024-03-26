import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/dashboard_screen/views/dashboard_screen_view.dart';
import 'package:getx_skeleton/app/modules/my_bet_screen/views/my_bet_screen_view.dart';
import 'package:getx_skeleton/app/modules/news_screen/views/news_screen_view.dart';
import 'package:getx_skeleton/app/modules/profile_screen/views/profile_screen_view.dart';
import 'package:getx_skeleton/app/modules/result_screen/views/result_screen_view.dart';

class HomeController extends GetxController {
  // // hold data coming from api
  // List<dynamic>? data;
  // // api call status
  // ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  //
  // // getting data from api
  // getData() async {
  //   // *) perform api call
  //   await BaseClient.safeApiCall(
  //     Constants.todosApiUrl, // url
  //     RequestType.get, // request type (get,post,delete,put)
  //     onLoading: () {
  //       // *) indicate loading state
  //       apiCallStatus = ApiCallStatus.loading;
  //       update();
  //     },
  //     onSuccess: (response){ // api done successfully
  //       data = List.from(response.data);
  //       // *) indicate success state
  //       apiCallStatus = ApiCallStatus.success;
  //       update();
  //     },
  //     // if you don't pass this method base client
  //     // will automatically handle error and show message to user
  //     onError: (error){
  //       // show error message to user
  //       BaseClient.handleApiError(error);
  //       // *) indicate error status
  //       apiCallStatus = ApiCallStatus.error;
  //       update();
  //     },
  //   );
  // }

  RxInt currentIndex = 0.obs;
  List<Widget> widgetList = [
    DashboardScreenView(),
    ResultScreenView(),
    const MyBetScreenView(),
    const NewsScreenView(),
    const ProfileScreenView()
  ];
}
