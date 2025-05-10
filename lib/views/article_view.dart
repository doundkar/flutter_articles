import 'package:articlehub/widgets/export.dart';
import 'package:flutter/material.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    String cleanedBody = controller.articleBody.value.replaceAll(RegExp(r'\n{2,}'), '\n').trim();
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Article',
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Get.offNamed('/articleslist');
              },
              child: const Text('Back'),
            ),
          )
        ],
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                controller.articleTitle.value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Divider(thickness: 1.5),
              const SizedBox(height: 8),
              // Body
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    cleanedBody,
                    // controller.articleBody.value.trim(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
