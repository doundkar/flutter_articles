import 'package:articlehub/widgets/export.dart';


class ArticleListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ArticleListController(),
    );
  }
}
