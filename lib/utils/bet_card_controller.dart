// // ignore_for_file: depend_on_referenced_packages

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../utils/bet_card_model.dart';

// class GameDetailsController extends GetxController {
//   var gameDetails = <GameDetails>[].obs;

//   @override
//   void onInit() {
//     fetchGameDetails();
//     super.onInit();
//   }

//   Future<void> fetchGameDetails() async {
//     try {
//       final response =
//           await http.get(Uri.parse('http://betlott.in/api/game-details'));
//       print(response.body);
//       if (response.statusCode == 200) {
//         List jsonResponse = json.decode(response.body);
//         gameDetails.value =
//             jsonResponse.map((data) => GameDetails.fromJson(data)).toList();
//       } else {
//         throw Exception('Failed to load game details');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
