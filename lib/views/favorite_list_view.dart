import 'package:articlehub/widgets/export.dart';
import 'package:flutter/material.dart';

class FavoriteListView extends GetView<FavoriteListController> {
  const FavoriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Favorite'),
      body: Obx(
        () =>
            controller.favoritesList.isEmpty
                ? Center(child: Text('No Favorite found...', style: Theme.of(context).textTheme.bodyLarge))
                : ListView.builder(
                  itemCount: controller.favoritesList.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    final favorite = controller.favoritesList[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              favorite['title'] ?? '',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(favorite['body'] ?? '', style: Theme.of(context).textTheme.bodyMedium),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      ),
      bottomNavigationBar: CommonBottomNavigationBar(currentIndex: 1),
    );
  }
}
