import 'package:articlehub/widgets/export.dart';

class ArticleController extends GetxController {
  RxString articleTitle = ''.obs;
  RxString articleBody = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null) {
      articleTitle.value = Get.arguments['title'];
      articleBody.value = Get.arguments['body'];
    }
  }
}
