import 'package:eticaret/logic/controllers/product_controller.dart';
import 'package:eticaret/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final favorite = 0;
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.favoriteProductList.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      'assets/images/kalp.jpeg',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    'Lütfen,Favori listenize ürün ekleyiniz ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          );
        } else {
          return ListView.separated(
              itemBuilder: (context, index) {
                var products = controller.favoriteProductList[index];
                return buildFavItems(products);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1.0,
                  color: Colors.grey,
                );
              },
              itemCount: controller.favoriteProductList.length);
        }
      }),
    );
  }

  Widget buildFavItems(ProductModel products) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: double.infinity,
        height: 105,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    products.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      products.title,
                      style: TextStyle(
                          overflow: TextOverflow.clip,
                          fontSize: 16,
                          color: Get.isDarkMode ? Colors.white : Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${products.price.toString()} TL',
                    style: TextStyle(
                        overflow: TextOverflow.clip,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Obx(
              () => IconButton(
                onPressed: () {
                  controller.manageFavorites(products.id);
                },
                icon: controller.isFavoriteProducts(products.id)
                    ? const Icon(Icons.favorite, color: Colors.red, size: 30)
                    : const Icon(Icons.favorite_border_rounded,
                        color: Colors.grey, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
