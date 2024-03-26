// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/response/payment_gateway_model.dart';
import 'package:getx_skeleton/app/modules/dashboard_screen/controllers/dashboard_screen_controller.dart';
import 'package:getx_skeleton/app/modules/my_wallet_screen/controllers/my_wallet_screen_controller.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/constants.dart';
import '../../../components/custom_snackbar.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../data/models/response/profile_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class DepositScreenController extends GetxController {
  PaymentGatewayModel paymentGatewayModel = PaymentGatewayModel();
  var gateways = <Gateways>[].obs;
  ApiCallStatus apiCallStatus = ApiCallStatus.loading;
  var selectedIndex = 0.obs;
  var isManual = false.obs;
  TextEditingController amountController = TextEditingController();
  ProfileModel profile = ProfileModel();
  final ImagePicker picker = ImagePicker();
  XFile? pickedImage;
  var imageFile = File('No File').obs;
  var imagePath = 'No Data'.obs;

  @override
  void onInit() {
    getGateways();
    getProfile();
    super.onInit();
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

  getGateways() async {
    String token = MySharedPref.getData('token') ?? '';
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.gatewayApiUrl, // url
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
        paymentGatewayModel = PaymentGatewayModel.fromJson(response.data);
        for (var element in paymentGatewayModel.gateways!) {
          if (element.name == "PayPal" ||
              element.name == "Stripe" ||
              element.name == "Flutterwave" ||
              element.id!.toInt() > 15) {
            gateways.add(element);
          }
        }
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

  sendDeposit() async {
    String token = MySharedPref.getData('token') ?? '';
    var data = isManual.value
        ? dio.FormData.fromMap({
            'receipt_image': [await dio.MultipartFile.fromFile(imagePath.value, filename: '')],
            'gateway_id': gateways[selectedIndex.value].id.toString(),
            'amount': amountController.text
          })
        : dio.FormData.fromMap(
            {'gateway_id': gateways[selectedIndex.value].id.toString(), 'amount': amountController.text});
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.depositApiUrl, // url
      RequestType.post, // request type (get,post,delete,put)
      headers: {'Authorization': 'Bearer $token'},
      data: data,
      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) async {
        imagePath.value = 'No Data';
        amountController.clear();
        selectedIndex.value = 0;
        isManual.value = false;
        // api done successfully
        final homeLogic = Get.find<DashboardScreenController>();
        final walletLogic = Get.find<MyWalletScreenController>();
        await homeLogic.getProfile();
        await walletLogic.getDeposits();
        await walletLogic.getTransactions();
        if (isManual.value) {
          CustomSnackBar.showCustomErrorToast(message: "Deposit request successful. Wait for review");
        }
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

  // Paypal payment
  handlePaypalPayment() {
    Get.to(UsePaypal(
        sandboxMode: true,
        clientId: gateways[selectedIndex.value].gatewayKeyOne ?? '',
        secretKey: gateways[selectedIndex.value].gatewayKeyTwo ?? '',
        returnURL: "https://samplesite.com/return",
        cancelURL: "https://samplesite.com/cancel",
        transactions: [
          {
            "amount": {
              "total": amountController.text,
              "currency": "USD",
              "details": {"subtotal": amountController.text, "shipping": '0', "shipping_discount": 0}
            },
            "description": "Deposit at Betpro",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": {
              "items": [
                {
                  "name": "Deposit at Betpro",
                  "quantity": 1,
                  "price": amountController.text,
                  "currency": "USD",
                }
              ],
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          CustomSnackBar.showCustomErrorToast(message: "Deposited successfully");
          await sendDeposit();
        },
        onError: (error) {
          CustomSnackBar.showCustomErrorToast(message: "An Error occured");
          Get.toNamed(Routes.HOME);
        },
        onCancel: (params) {
          CustomSnackBar.showCustomErrorToast(message: "Payment Cancelled");
          Get.toNamed(Routes.HOME);
        }));
  }

  //Stripe Payment
  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': "USD",
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${gateways[selectedIndex.value].gatewayKeyOne}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  handleStripePayment() async {
    try {
      //STEP 1: Create Payment Intent
      var paymentIntent = await createPaymentIntent((amountController.text.toInt() * 100).toString(), "USD");
      Stripe.publishableKey = gateways[selectedIndex.value].gatewayKeyTwo ?? '';
      //STEP 2: Initialize Payment Sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'], //Gotten from payment intent
              style: ThemeMode.light,
              merchantDisplayName: "Betpro"));

      //STEP 3: Display Payment sheet
      await Stripe.instance.presentPaymentSheet().then((value) async {
        CustomSnackBar.showCustomErrorToast(message: "Deposited successfully");
        await sendDeposit();
        paymentIntent = null;
      });
    } on StripeException catch (e) {
      CustomSnackBar.showCustomErrorToast(message: e.toString());
    }
  }

  handleFlutterWavePayment() async {
    final Customer customer = Customer(
      name: profile.user?.name ?? "Betpro",
      phoneNumber: profile.user?.mobile ?? "123456789",
      email: profile.user?.email ?? "user@betpro.com",
    );
    final Flutterwave flutterwave = Flutterwave(
        context: Get.context!,
        publicKey: gateways[selectedIndex.value].gatewayKeyOne ?? '',
        currency: "USD",
        redirectUrl: 'https://facebook.com',
        txRef: DateTime.now().millisecondsSinceEpoch.toString(),
        amount: amountController.text,
        customer: customer,
        paymentOptions: "card, payattitude, barter, bank transfer, ussd",
        customization: Customization(title: "Test Payment"),
        isTestMode: true);
    final ChargeResponse response = await flutterwave.charge();
    if (response.success == true) {
      CustomSnackBar.showCustomErrorToast(message: "Deposited successfully");
      await sendDeposit();
    } else {
      CustomSnackBar.showCustomErrorToast(message: "Payment Cancelled");
      Get.toNamed(Routes.HOME);
    }
  }
}
