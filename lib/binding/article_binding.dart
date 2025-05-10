import 'package:articlehub/widgets/export.dart';
import 'package:get/get.dart';

class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ArticleController(),
    );
  }
}
