import 'package:articlehub/widgets/colorutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const CommonBottomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: ColorUtils.accent,
      unselectedItemColor: ColorUtils.unSelectedColor,
      onTap: (index) {
        if (index == 0) {
          Get.offNamed('/articleslist');
        } else if (index == 1) {
          Get.offNamed('/favorites');
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Articles'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
      ],
    );
  }
}
