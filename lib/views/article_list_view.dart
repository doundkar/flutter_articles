import 'package:articlehub/widgets/export.dart';
import 'package:flutter/material.dart';

class ArticleList extends GetView<ArticleListController> {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Articles',
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Custom Search Bar
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                onChanged: controller.filterArticles,
                decoration: InputDecoration(
                  hintText: 'Search articles...',
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorUtils.accent,
                      width: 2,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            //  Article List
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                final articles = controller.filteredArticles;
                if (articles.isEmpty) {
                  return const Center(child: Text('No articles found.'));
                }
                return RefreshIndicator(
                  onRefresh: controller.getArticlesList,
                  child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.article, color: Colors.blue),
                          title: Text(
                            articles[index].title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            articles[index].body ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: InkWell(
                              onTap: () {
                                Get.offNamed('/articleslist/article', arguments: {
                                  "id": articles[index].id,
                                  "title": articles[index].title,
                                  "body": articles[index].body
                                });
                              },
                              child: const Icon(Icons.arrow_forward_ios, size: 16)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CommonBottomNavigationBar(currentIndex: 0),
    );
  }
}
