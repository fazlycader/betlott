import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_snackbar.dart';
import 'package:getx_skeleton/app/components/timer_controller.dart';
import 'package:getx_skeleton/app/data/models/model_item_cart.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trotter/trotter.dart';

import '../../../services/api_call_status.dart';

class BetDetailsScreenController extends GetxController with GetTickerProviderStateMixin {
  ApiCallStatus apiCallStatus = ApiCallStatus.success;

  TabController? digitTypesTabController;
  TabController? betTypesTabController;
  TabController? priceTabController;

  var digitTypesTabIndex = 0.obs;
  var betTypesTabIndex = 0.obs;
  var priceTabIndex = 0.obs;

  var oneDBetOptions = ['All Board', 'A', 'B', 'C'];
  var twoDBetOptions = ['All Board', 'AB', 'BC', 'AC'];
  var threeDBetOptions = ['Box', 'ABC'];
  var fourDBetOptions = ['Box', 'ABCD'];

  var threeDPriceOptions = ['₹12', '₹25', '₹30', '₹60'];
  var fourDPriceOptions = ['₹20', '₹95'];

  var betTypesOptions = <String>[].obs;
  var priceOptions = <String>[].obs;

  var digitsControllers = [
    TextEditingController(), // Digits controller
    TextEditingController(), // Digits controller
    TextEditingController(), // Digits controller
    TextEditingController(), // Digits controller
    TextEditingController(text: "0"), // Quantity controller
  ];

  var focusNodes = List.generate(4, (index) => FocusNode());

  var totalTickets = 0.obs;
  var totalAmount = 0.obs;
  var availableBalance = 1234;

  late TimerController timerController;

  List<ModelItemCart> cartItems = <ModelItemCart>[].obs;
  late int selectedPrice;
  late String selectedDigitsName;

  @override
  void onInit() {
    // match = Get.arguments[0];
    // getProfile();

    timerController = Get.find<TimerController>();
    betTypesOptions.addAll(oneDBetOptions);
    initializeGameTypesTabController();
    initializeBetTypesTabController();
    initializePriceTabsController();

    digitsControllers[4].addListener(() {
      changeSelectedPrice();
    });
    super.onInit();
  }

  initializeGameTypesTabController() {
    digitTypesTabController = TabController(length: 4, vsync: this);
    digitTypesTabIndex.value = 0;
    digitTypesTabController?.addListener(() {
      digitTypesTabIndex.value = digitTypesTabController!.index;
      for (final controller in digitsControllers) {
        controller.clear();
      }
      betTypesOptions.clear();

      if (digitTypesTabIndex.value == 0) {
        betTypesOptions.addAll(oneDBetOptions);
      }
      if (digitTypesTabIndex.value == 1) {
        betTypesOptions.addAll(twoDBetOptions);
      }
      if (digitTypesTabIndex.value == 2) {
        betTypesOptions.addAll(threeDBetOptions);
        showPriceTabs(2);
      }
      if (digitTypesTabIndex.value == 3) {
        betTypesOptions.addAll(fourDBetOptions);
        showPriceTabs(3);
      }
      initializeBetTypesTabController();
      resetTickets();
      update();
    });
  }

  showPriceTabs(int gameIndex) {
    priceOptions.clear();
    if (gameIndex == 2) {
      priceOptions.addAll(threeDPriceOptions);
    }
    if (gameIndex == 3) {
      priceOptions.addAll(fourDPriceOptions);
    }
    initializePriceTabsController();
    update();
  }

  initializeBetTypesTabController() {
    betTypesTabController = TabController(length: betTypesOptions.length, vsync: this);
    betTypesTabIndex.value = 0;
    betTypesTabController?.addListener(() {
      betTypesTabIndex.value = betTypesTabController!.index;
      resetTickets();
      update();
    });
  }

  initializePriceTabsController() {
    priceTabController = TabController(length: priceOptions.length, vsync: this);
    priceTabIndex.value = 0;
    priceTabController?.addListener(() {
      priceTabIndex.value = priceTabController!.index;
      resetTickets();
      update();
    });
  }

  changeSelectedPrice() {
    if (digitTypesTabIndex.value == 0 || digitTypesTabIndex.value == 1) {
      // 1 digit or 2 digit game is selected
      selectedPrice = 12;
    } else if (digitTypesTabIndex.value == 2) {
      // 3 digit game is selected
      if (priceTabIndex.value == 0) {
        selectedPrice = 12;
      }
      if (priceTabIndex.value == 1) {
        selectedPrice = 25;
      }
      if (priceTabIndex.value == 2) {
        selectedPrice = 30;
      }
      if (priceTabIndex.value == 3) {
        selectedPrice = 60;
      }
    } else {
      // 4 digit game is selected
      if (priceTabIndex.value == 0) {
        selectedPrice = 20;
      }
      if (priceTabIndex.value == 1) {
        selectedPrice = 95;
      }
    }
  }

  add1Ticket() {
    digitsControllers[4].text = (digitsControllers[4].text.toInt() + 1).toString();
    changeSelectedPrice();
  }

  add5Tickets() {
    digitsControllers[4].text = (digitsControllers[4].text.toInt() + 5).toString();
    changeSelectedPrice();
  }

  remove1Ticket() {
    if (digitsControllers[4].text.toInt() > 0) {
      digitsControllers[4].text = (digitsControllers[4].text.toInt() - 1).toString();
      changeSelectedPrice();
    }
  }

  remove5Tickets() {
    if (digitsControllers[4].text.toInt() > 4) {
      digitsControllers[4].text = (digitsControllers[4].text.toInt() - 5).toString();
      changeSelectedPrice();
    } else {
      resetTickets();
    }
  }

  resetTickets() {
    digitsControllers[4].text = "0";
    update();
  }

  resetForm() {
    for (final controller in digitsControllers) {
      controller.clear();
    }
    resetTickets();
  }

  addToCart() {
    var showError = false;
    String digit1 = digitsControllers[0].text;
    String digit2 = digitsControllers[1].text;
    String digit3 = digitsControllers[2].text;
    String digit4 = digitsControllers[3].text;

    if (digitTypesTabIndex.value == 0) {
      // 1 digit game is selected
      if (digit1.isEmpty) showError = true;
    } else if (digitTypesTabIndex.value == 1) {
      // 2 digit game is selected
      if (digit1.isEmpty || digit2.isEmpty) showError = true;
    } else if (digitTypesTabIndex.value == 2) {
      // 3 digit game is selected
      if (digit1.isEmpty || digit2.isEmpty || digit3.isEmpty) showError = true;
    } else {
      // 4 digit game is selected
      if (digit1.isEmpty || digit2.isEmpty || digit3.isEmpty || digit4.isEmpty) showError = true;
    }
    if (showError) {
      CustomSnackBar.showCustomErrorToast(message: "Enter all digits");
      return;
    }
    if (digitsControllers[4].text == "0" || digitsControllers[4].text.isEmpty) {
      CustomSnackBar.showCustomErrorToast(message: "Select ticket count");
      return;
    }
    computeDigitsName();

    final digits = "$digit1$digit2$digit3$digit4";

    int? generatedPairs;
    if (selectedDigitsName == "Box") {
      generatedPairs = getPossibleCombinations(digits).length;
    } else if (selectedDigitsName == "All Board") {
      generatedPairs = 3;
    }
    totalTickets.value += getTicketsQuantity(generatedPairs);
    totalAmount.value += selectedPrice.toInt() * getTicketsQuantity(generatedPairs);

    var item = ModelItemCart(
      digitsName: selectedDigitsName,
      ticketsCount: digitsControllers[4].text.toInt(),
      digits: digits,
      price: selectedPrice,
      pairsGeneratedCount: generatedPairs,
    );
    cartItems.add(item);
    resetForm();
    update();
  }

  deleteFromCart(ModelItemCart item) {
    cartItems.remove(item);
    totalAmount.value -=
        item.price * item.ticketsCount * (item.pairsGeneratedCount == null ? 1 : item.pairsGeneratedCount!);
    totalTickets.value -= item.ticketsCount * (item.pairsGeneratedCount == null ? 1 : item.pairsGeneratedCount!);
    update();
  }

  Set<dynamic> getPossibleCombinations(digits) {
    // final bagOfItems = characters(digits), permutations = Permutations(3, bagOfItems);
    final items = characters(digits),
        indices = List<int>.generate(items.length, (i) => i),
        permsOfItems = indices.permutations().iterable.map((perm) => perm.map((index) => items[index]).join());

    return permsOfItems.toSet();
  }

  int getTicketsQuantity(int? pairsCount) {
    var quantity = 0;
    if (selectedDigitsName != "Box" && selectedDigitsName != "All Board") {
      quantity = digitsControllers[4].text.toInt();
    } else {
      quantity = digitsControllers[4].text.toInt() * pairsCount!;
    }
    return quantity;
  }

  computeDigitsName() {
    if (digitTypesTabIndex.value == 0) {
      // 1 digit game is selected
      if (betTypesTabIndex.value == 0) {
        // All Board is selected
        selectedDigitsName = "All Board";
      } else if (betTypesTabIndex.value == 1) {
        // A is selected
        selectedDigitsName = "A";
      } else if (betTypesTabIndex.value == 2) {
        // B is selected
        selectedDigitsName = "B";
      } else if (betTypesTabIndex.value == 3) {
        // C is selected
        selectedDigitsName = "C";
      }
    } else if (digitTypesTabIndex.value == 1) {
      //2 digit game is selected
      if (betTypesTabIndex.value == 0) {
        // All Board is selected
        selectedDigitsName = "All Board";
      } else if (betTypesTabIndex.value == 1) {
        // AB is selected
        selectedDigitsName = "AB";
      } else if (betTypesTabIndex.value == 2) {
        // BC is selected
        selectedDigitsName = "BC";
      } else if (betTypesTabIndex.value == 3) {
        // AC is selected
        selectedDigitsName = "AC";
      }
    } else if (digitTypesTabIndex.value == 2) {
      // 3 digit game is selected
      if (betTypesTabIndex.value == 0) {
        // Box is selected
        selectedDigitsName = "Box";
      } else if (betTypesTabIndex.value == 1) {
        // ABC is selected
        selectedDigitsName = "ABC";
      }
    } else {
      // 4 digit game is selected
      if (betTypesTabIndex.value == 0) {
        // Box is selected
        selectedDigitsName = "Box";
      } else if (betTypesTabIndex.value == 1) {
        // ABCD is selected
        selectedDigitsName = "ABCD";
      }
    }
  }

//   sendPrediction() async {
//     String token = MySharedPref.getData('token') ?? '';
//     // *) perform api call
//     await BaseClient.safeApiCall(
//       Constants.predictionApiUrl, // url
//       RequestType.post, // request type (get,post,delete,put)
//       headers: {'Authorization': 'Bearer $token'},
//       data: {
//         'invest_amount': investAmountController.text,
//         'betoption_id': optionId.value,
//         'match_id': matchId.value,
//         'betquestion_id': questionId.value,
//         'return_amount': int.parse(investAmountController.text) * ratio.value
//       },
//       onLoading: () {
//         // *) indicate loading state
//         apiCallStatus = ApiCallStatus.loading;
//         update();
//       },
//       onSuccess: (response) {
//         // api done successfully
//         showCustomDialogue(
//             title: 'Congratulations!',
//             description: 'Your bet has been placed successfully',
//             icon: Icons.check_circle,
//             onPressed: () {
//               Get.toNamed(Routes.HOME);
//             },
//             buttonText: 'Back to Home');
//         // *) indicate success state
//         apiCallStatus = ApiCallStatus.success;
//         update();
//       },
//       // if you don't pass this method base client
//       // will automaticly handle error and show message to user
//       onError: (error) {
//         // show error message to user
//         BaseClient.handleApiError(error);
//         // *) indicate error status
//         apiCallStatus = ApiCallStatus.error;
//         update();
//       },
//     );
//   }
//
//   getProfile() async {
//     String token = MySharedPref.getData('token') ?? '';
//     // *) perform api call
//     await BaseClient.safeApiCall(
//       Constants.profileApiUrl, // url
//       RequestType.get, // request type (get,post,delete,put)
//       headers: {'Authorization': 'Bearer $token'},
//       onLoading: () {
//         // *) indicate loading state
//         apiCallStatus = ApiCallStatus.loading;
//         update();
//       },
//       onSuccess: (response) {
//         // api done successfully
//         profile = ProfileModel.fromJson(response.data);
//         // *) indicate success state
//         apiCallStatus = ApiCallStatus.success;
//         update();
//       },
//       // if you don't pass this method base client
//       // will automaticly handle error and show message to user
//       onError: (error) {
//         // show error message to user
//         BaseClient.handleApiError(error);
//         // *) indicate error status
//         apiCallStatus = ApiCallStatus.error;
//         update();
//       },
//     );
//   }
}
