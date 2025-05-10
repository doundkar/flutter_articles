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
      selectedItemColor: ColorUtils().error,
      unselectedItemColor: ColorUtils().unSelectedColor,
      onTap: (index) {
        if (index == 0) {
          Get.offAllNamed('/menulist');
        } else if (index == 1) {
          Get.offAllNamed('/cart');
        }
      },
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Menu'),
        const BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Menu'),
        // BottomNavigationBarItem(
        //   icon: Obx(
        //     () => badges.Badge(
        //       showBadge: Get.find<FoodService>().cartItemCount.value > 0 ? true : false,
        //       position: badges.BadgePosition.topEnd(top: -10, end: -12),
        //       badgeContent: Text(Get.find<FoodService>().cartItemCount.toString()),
        //       child: const Icon(Icons.shopping_cart),
        //     ),
        //   ),
        //   label: 'Cart',
        // ),
      ],
    );
  }
}
