import 'package:eticaret/models/product_model.dart';
import 'package:eticaret/routes/routes.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModel products) {
    if (productsMap.containsKey(products)) {
      productsMap[products] += 1;
    } else {
      productsMap[products] = 1;
    }
  }

  void removeProductToCart(ProductModel products) {
    if (productsMap.containsKey(products) && productsMap[products] == 1) {
      productsMap.removeWhere((key, value) => key == products);
    } else {
      productsMap[products] -= 1;
    }
  }

  void removeOneProduct(ProductModel products) {
    productsMap.removeWhere((key, value) => key == products);
    Get.snackbar(
      'Başarılı',
      'Ürün Silindi',
      colorText: Colors.white,
      backgroundColor: Get.isDarkMode ? pinkColor : mainColor,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void clearAllProducts() {
    Get.defaultDialog(
        title: 'Silme',
        titleStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        backgroundColor: Colors.orange.shade100,
        buttonColor: Get.isDarkMode ? pinkColor : mainColor,
        middleText: 'Tüm ürünleri silmek istediğinizden emin misiniz ?',
        middleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
        cancelTextColor: Colors.red.shade200,
        onConfirm: () {
          productsMap.clear();
          Get.back();
          Get.snackbar(
            'Başarılı',
            'Ürünler Silindi',
            colorText: Colors.white,
            backgroundColor: Get.isDarkMode ? pinkColor : mainColor,
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        textConfirm: 'Evet',
        confirmTextColor: Colors.blue.shade200,
        textCancel: 'Hayır',
        radius: 15,
        onCancel: () {
          Get.offNamed(Routes.cartScreen);
        });
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get totalPrice => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
