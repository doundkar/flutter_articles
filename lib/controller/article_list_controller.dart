

import 'package:articlehub/widgets/export.dart';

class ArticleListController extends GetxController {
  RxList<Article> articles = <Article>[].obs;
  RxBool isLoading = false.obs;
  RxList<Article> filteredArticles = <Article>[].obs;
  // RxString selectedFilter = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    print("Insid oninit");
    await getArticlesList();
  }

  Future<void> getArticlesList() async {
    try {
      isLoading.value = true;
      final result = await Get.find<ArticleService>().fetchData(Get.find<ArticleService>().articlesApiUrl);
      if (result.isNotEmpty) {
        articles.value = result.map((element) => Article.fromJson(element)).toList();
        articles.refresh();
        filteredArticles.value = articles;
        isLoading.value = false;
      } else {
        isLoading.value = false;
        Get.snackbar(
          "Warning",
          "No Article found.",
          backgroundColor: ColorUtils().warning,
          duration: Duration(seconds: 3),
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        "Failed to load article: $e",
        backgroundColor: ColorUtils().error,
        duration: Duration(seconds: 3),
      );
    }
  }

  void filterArticles(String query) {
    if (query.isEmpty) {
      filteredArticles.value = articles;
    } else {
      filteredArticles.value = articles.where((article) {
        final title = article.title?.toLowerCase() ?? '';
        final body = article.body?.toLowerCase() ?? '';
        return title.contains(query.toLowerCase()) || body.contains(query.toLowerCase());
      }).toList();
    }
  }
}
