import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/create_bet_comment_screen_controller.dart';

class CreateBetCommentScreenView extends GetView<CreateBetCommentScreenController> {
  const CreateBetCommentScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateBetCommentScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CreateBetCommentScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
