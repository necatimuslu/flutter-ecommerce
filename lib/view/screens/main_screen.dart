// ignore_for_file: invalid_use_of_protected_member

import 'package:badges/badges.dart';
import 'package:eticaret/logic/controllers/cart_controller.dart';
import 'package:eticaret/logic/controllers/main_controller.dart';
import 'package:eticaret/routes/routes.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            controller.title[controller.currentIndex.value],
            style: const TextStyle(fontSize: 25),
          ),
          leading: Container(),
          backgroundColor: Get.isDarkMode ? darkGreyColor : mainColor,
          centerTitle: true,
          actions: [
            Obx(
              () => Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  cartController.quantity().toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    icon: const Icon(Icons.shopping_bag_sharp, size: 25)),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          elevation: 0,
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Get.isDarkMode ? mainColor : pinkColor,
              ),
              icon: Icon(
                Icons.home,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.shopping_basket,
                color: Get.isDarkMode ? mainColor : pinkColor,
              ),
              icon: Icon(
                Icons.shopping_basket,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? mainColor : pinkColor,
              ),
              icon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? mainColor : pinkColor,
              ),
              icon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
          ],
          onTap: (val) {
            controller.currentIndex.value = val;
          },
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs.value,
        ),
      );
    }));
  }
}
