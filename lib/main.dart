import 'package:articlehub/widgets/export.dart';
import 'package:flutter/material.dart';

void main() async {
  await Get.putAsync<ArticleService>(() => ArticleService().onInit());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorUtils.primary,
          useMaterial3: true,
          scaffoldBackgroundColor: ColorUtils.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorUtils.primary,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: ColorUtils.textPrimary),
            bodyMedium: TextStyle(color: ColorUtils.textSecondary),
          ),
        ),
        initialBinding: ArticleListBinding(),
        getPages: [
          GetPage(
            name: '/articleslist',
            page: () => const ArticleList(),
            binding: ArticleListBinding(),
          ),
          GetPage(
              name: '/articleslist/article',
              page: () => const ArticleView(),
              binding: ArticleBinding(),
              parameters: {"parent": "/articleslist"})
        ],
        home: ArticleList());
  }
}
