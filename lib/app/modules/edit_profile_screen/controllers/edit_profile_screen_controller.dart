// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../data/local/my_shared_pref.dart';
import '../../../services/api_call_status.dart';

class EditProfileScreenController extends GetxController {
  //TODO: Implement EditProfileScreenController
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  ApiCallStatus apiCallStatus = ApiCallStatus.success;
  String profilePicture =
      'https://st2.depositphotos.com/2703645/7304/v/600/depositphotos_73040075-stock-illustration-male-avatar-icon.jpg';
  final ImagePicker picker = ImagePicker();
  XFile? pickedImage;
  var imageFile = File('No File').obs;
  var imagePath = 'No Data'.obs;

  updateProfile() async {
    apiCallStatus = ApiCallStatus.loading;
    String token = MySharedPref.getData('token') ?? '';
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest('POST', Uri.parse(Constants.updateProfileApiUrl));
    request.fields.addAll({
      'name': nameController.text,
      'gender': '1',
      'mobile': mobileController.text,
      'address': addressController.text,
      'zip_code': '11111',
      'city': cityController.text,
      'country': countryController.text
    });
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.value.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      apiCallStatus = ApiCallStatus.success;
      if (kDebugMode) {
        print(await response.stream.bytesToString());
      }
    } else {
      apiCallStatus = ApiCallStatus.error;
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
    }
  }
}
