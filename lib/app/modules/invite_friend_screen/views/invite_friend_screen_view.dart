import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/invite_friend_screen_controller.dart';

class InviteFriendScreenView extends GetView<InviteFriendScreenController> {
  const InviteFriendScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InviteFriendScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InviteFriendScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
