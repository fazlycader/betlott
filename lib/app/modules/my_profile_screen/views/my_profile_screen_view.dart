import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/my_profile_screen_controller.dart';

class MyProfileScreenView extends GetView<MyProfileScreenController> {
  const MyProfileScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyProfileScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyProfileScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
