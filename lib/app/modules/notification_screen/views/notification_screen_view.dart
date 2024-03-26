import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notification_screen_controller.dart';

class NotificationScreenView extends GetView<NotificationScreenController> {
  const NotificationScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NotificationScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
