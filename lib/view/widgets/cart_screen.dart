import 'package:eticaret/logic/controllers/cart_controller.dart';
import 'package:eticaret/models/product_model.dart';

import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/cart_total.dart';
import 'package:eticaret/view/widgets/empty_cart.dart';

import 'package:eticaret/view/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text('Alışveriş Sepeti'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyColor : mainColor,
          actions: [
            IconButton(
                onPressed: () {
                  if (controller.productsMap.isNotEmpty) {
                    controller.clearAllProducts();
                  } else {
                    Get.back();
                  }
                },
                icon: const Icon(Icons.backspace))
          ],
        ),
        body: Obx(() {
          if (controller.productsMap.isEmpty) {
            return const EmptyCart();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        ProductModel products =
                            controller.productsMap.keys.toList()[index];

                        return ProductCardPage(
                          products: products,
                          index: index,
                          quantity:
                              controller.productsMap.values.toList()[index],
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: controller.productsMap.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 30,
                    ),
                    child: CartTotal(),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
