// ignore_for_file: depend_on_referenced_packages, unrelated_type_equality_checks

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/response/home_screen_model.dart';
import 'package:getx_skeleton/app/services/api_call_status.dart';

import '../../../../utils/constants.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../data/models/response/profile_model.dart';
import '../../../services/base_client.dart';

class DashboardScreenController extends GetxController {
  //TODO: Implement DashboardScreenController
  ApiCallStatus apiCallStatus = ApiCallStatus.success;
  HomeScreenModel data = HomeScreenModel();
  ProfileModel profile = ProfileModel();
  RxList<GameDetails> gameDetailsList = <GameDetails>[].obs;

  @override
  void onInit() {
    // getProfile();
    fetchGameDetails();
    getData();
    super.onInit();
  }

  int cateLengthFinder(int id) {
    int subCatLength = 0;
    for (var element in data.subCategory!) {
      if (element.catId == id.toString()) {
        subCatLength++;
      }
    }

    return subCatLength;
  }

  // getting data from api
  getData() async {
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.homeApiUrl, // url
      RequestType.get, // request type (get,post,delete,put)
      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully
        if (kDebugMode) {
          print('before response');
        }
        if (kDebugMode) {
          print(response.data);
        }
        data = HomeScreenModel.fromJson(response.data);
        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user
        if (kDebugMode) {
          print(error);
        }
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

  fetchGameDetails() async {
    try {
      final response = await BaseClient.safeApiCall(
        Constants.gameDetailsUrl,
        RequestType.get,
        onLoading: () {
          apiCallStatus = ApiCallStatus.loading;
          update();
        },
        onSuccess: (response) {
          final List<dynamic> jsonResponse = response.data; // Adjust here
          final List<Map<String, dynamic>> parsedData =
              jsonResponse.cast<Map<String, dynamic>>(); // Adjust here
          gameDetailsList.assignAll(
            parsedData.map((data) => GameDetails.fromJson(data)).toList(),
          );
          apiCallStatus = ApiCallStatus.success;
          update();
        },
        onError: (error) {
          BaseClient.handleApiError(error);
          apiCallStatus = ApiCallStatus.error;
          update();
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching game details: $e');
      }
      apiCallStatus = ApiCallStatus.error;
      update();
    }
  }
}

class GameDetails {
  final num id;
  final String gameName;
  final String winningPrice;
  final String gameLogo;
  final String gameStartTime;
  final String betClosingTime;
  final String gameEndTime;

  GameDetails({
    required this.id,
    required this.gameName,
    required this.winningPrice,
    required this.gameLogo,
    required this.gameStartTime,
    required this.betClosingTime,
    required this.gameEndTime,
  });

  factory GameDetails.fromJson(Map<String, dynamic> json) {
    return GameDetails(
      id: json['id'],
      gameName: json['Game_Name'],
      winningPrice: json['Winning_price'],
      gameLogo: json['Game_logo'],
      gameStartTime: json['Game_Start_Time'],
      betClosingTime: json['Bet_Closing_Time'],
      gameEndTime: json['Game_End_Time'],
    );
  }
}
