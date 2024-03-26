import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // Import DateFormat from intl package
import '../../../data/models/response/game_result_model.dart';

class ResultScreenController extends GetxController {
  var gameResults = <GameResult>[].obs;
  var apiResponse = <String, List<dynamic>>{}.obs;
  List<Game> games = [];
  var selectedDigit = ''.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    // Calculate the date 30 days ago
    final thirtyDaysAgo = DateTime.now().subtract(Duration(days: 30));
    final formattedDate = DateFormat('yyyy-MM-dd').format(thirtyDaysAgo);

    var response = await http.get(Uri.parse(
        'http://betlott.in/api/winning-numbers?created_at=$formattedDate'));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse is Map<String, dynamic>) {
        apiResponse.value = jsonResponse.map((key, value) {
          if (value is List) {
            return MapEntry(key, value);
          } else if (value is Map<String, dynamic>) {
            List<dynamic> winningNumbers = value['winning_numbers'];
            return MapEntry(key, winningNumbers);
          } else {
            return MapEntry(key, []);
          }
        });

        List<GameResult> results = [];
        for (var item in jsonResponse.values.expand(
            (value) => value is List ? value : value['winning_numbers'])) {
          results.add(GameResult.fromJson(item));
        }
        gameResults.assignAll(results);
      } else {
        if (kDebugMode) {
          print('Unexpected response format.');
        }
      }
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }

  void extractGames(Map<String, dynamic> jsonResponse) {
    Set<String> gameNames = {};
    for (var entry in jsonResponse.entries) {
      for (var result in entry.value) {
        String gameName = result['game_details']['game_name'];
        gameNames.add(gameName);
      }
    }
    games = gameNames.map((name) => Game(name)).toList();
  }

  void setSelectedDigit(int digit) {
    selectedDigit.value = digit.toString();
  }
}

class Game {
  final String name;
  Game(this.name);
}
