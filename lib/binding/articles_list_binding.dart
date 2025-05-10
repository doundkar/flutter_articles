import 'package:articlehub/controller/article_list_controller.dart';
import 'package:get/get.dart';

class ArticleListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ArticleListController(),
    );
  }
}
