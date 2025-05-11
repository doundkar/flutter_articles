import 'dart:convert';
import 'dart:async';
import 'package:articlehub/widgets/export.dart';

class ArticleListController extends GetxController {
  RxList<Article> articles = <Article>[].obs;
  RxBool isLoading = false.obs;
  RxList<Article> filteredArticles = <Article>[].obs;
  RxSet<int> favoriteIds = <int>{}.obs;
  RxBool isConnected = true.obs;
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
    connectivitySubscription = Connectivity().onConnectivityChanged.listen((results) async {
      final isNowConnected = results.any((result) => result != ConnectivityResult.none);
      isConnected.value = isNowConnected;

      if (!isConnected.value) {
        Get.snackbar(
          "No Internet",
          "Please check your internet connection.",
          backgroundColor: ColorUtils.warning,
          duration: const Duration(seconds: 3),
        );
      } else {
        if (articles.isEmpty) {
          await getArticlesList();
        }
      }
    });
  }

  Future<void> _initConnectivity() async {
    final results = await Connectivity().checkConnectivity();
    isConnected.value = results != ConnectivityResult.none;

    if (!isConnected.value) {
      Get.snackbar(
        "No Internet",
        "Please check your internet connection.",
        backgroundColor: ColorUtils.warning,
        duration: const Duration(seconds: 3),
      );
    } else {
      await getArticlesList();
      await loadFavorites();
    }
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
          backgroundColor: ColorUtils.warning,
          duration: Duration(seconds: 3),
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        "Failed to load article: $e",
        backgroundColor: ColorUtils.error,
        duration: Duration(seconds: 3),
      );
    }
  }

  void filterArticles(String query) {
    if (query.isEmpty) {
      filteredArticles.value = articles;
    } else {
      filteredArticles.value =
          articles.where((article) {
            final title = article.title?.toLowerCase() ?? '';
            final body = article.body?.toLowerCase() ?? '';
            return title.contains(query.toLowerCase()) || body.contains(query.toLowerCase());
          }).toList();
    }
  }

  Future<void> toggleFavorite(Article article) async {
    final prefs = await SharedPreferences.getInstance();
    // Load existing favorites
    final String? existingData = prefs.getString('favorite_articles');
    List<Map<String, dynamic>> favorites = [];
    if (existingData != null) {
      favorites = List<Map<String, dynamic>>.from(jsonDecode(existingData));
    }
    final isAlreadyFavorite = favorites.any((item) => item['id'] == article.id);
    if (isAlreadyFavorite) {
      favorites.removeWhere((item) => item['id'] == article.id);
      favoriteIds.remove(article.id);
    } else {
      favorites.add({'id': article.id, 'title': article.title, 'body': article.body});
      favoriteIds.add(article.id!);
    }
    await prefs.setString('favorite_articles', jsonEncode(favorites));
  }

  Future<void> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? existingData = prefs.getString('favorite_articles');
      if (existingData != null) {
        final List<dynamic> favorites = jsonDecode(existingData);
        favoriteIds.value = favorites.map<int>((item) => item['id'] as int).toSet();
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
