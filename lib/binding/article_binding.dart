import 'package:articlehub/widgets/export.dart';


class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ArticleController(),
    );
  }
}
