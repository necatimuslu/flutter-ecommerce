// ignore_for_file: non_constant_identifier_names

import 'package:eticaret/logic/controllers/cart_controller.dart';
import 'package:eticaret/logic/controllers/category_controller.dart';
import 'package:eticaret/logic/controllers/product_controller.dart';
import 'package:eticaret/models/product_model.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/screens/product_detail_screen.dart';
import 'package:eticaret/view/widgets/text_util.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text('Kategori Detay'),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? pinkColor : mainColor,
        ),
        body: Obx(() {
          if (categoryController.isCategoryProductLoading.value) {
            return const CircularProgressIndicator();
          } else {
            return GridView.builder(
              itemCount: categoryController.categoryProductList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 9.0,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 6.0,
                  maxCrossAxisExtent: 200),
              itemBuilder: (context, index) {
                ProductModel product =
                    categoryController.categoryProductList[index];

                return BuildCartItems(context: context, product: product);
              },
            );
          }
        }));
  }

  Widget BuildCartItems({required context, required ProductModel product}) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailScreen(product: product));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          margin: const EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 2.0,
                    spreadRadius: 3.0)
              ]),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            controller.manageFavorites(product.id);
                          },
                          icon: controller.isFavoriteProducts(product.id)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                )),
                      IconButton(
                          onPressed: () {
                            cartController.addProductToCart(product);
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${product.price.toString()} TL',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 20,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? pinkColor : mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 2),
                      child: Row(
                        children: [
                          TextUtil(
                              text: product.rating.rate.toString(),
                              textSize: 13,
                              textColor: Colors.white,
                              fontWeight: FontWeight.bold),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 1),
                            child:
                                Icon(Icons.star, size: 13, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
