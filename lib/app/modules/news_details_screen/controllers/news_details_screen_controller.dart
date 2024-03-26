import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/response/news_list_model.dart';

class NewsDetailsScreenController extends GetxController {
  //TODO: Implement NewsDetailsScreenController

  var news = News().obs;

  @override
  void onInit() {
    news.value = Get.arguments[0];
    super.onInit();
  }
}
