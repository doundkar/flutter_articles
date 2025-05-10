import 'dart:convert';
import 'package:articlehub/widgets/export.dart';

class FavoriteListController extends GetxController {
  RxList<dynamic> favoritesList = [].obs;

  @override
  void onInit() async {
    super.onInit();
    await getFavoritesList();
  }

  Future<void> getFavoritesList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? favoriteData = prefs.getString('favorite_articles');
      if (favoriteData != null) {
        favoritesList.value = jsonDecode(favoriteData);
        favoritesList.refresh();
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load favorites: $e',
        backgroundColor: ColorUtils.error,

        duration: Duration(seconds: 3),
      );
    }
  }
}
