import 'package:articlehub/widgets/export.dart';


class FavoriteListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteListController());
  }
}
