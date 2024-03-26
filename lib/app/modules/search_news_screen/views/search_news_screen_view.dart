import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_news_screen_controller.dart';

class SearchNewsScreenView extends GetView<SearchNewsScreenController> {
  const SearchNewsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchNewsScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchNewsScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
