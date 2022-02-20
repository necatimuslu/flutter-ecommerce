// ignore_for_file: must_be_immutable

import 'package:eticaret/logic/controllers/cart_controller.dart';
import 'package:eticaret/models/product_model.dart';
import 'package:eticaret/utils/theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardPage extends StatelessWidget {
  ProductModel products;
  final int index;
  final int quantity;
  ProductCardPage(
      {Key? key,
      required this.products,
      required this.index,
      required this.quantity})
      : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Get.isDarkMode
            ? pinkColor.withOpacity(0.6)
            : mainColor.withOpacity(0.3),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 7),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(products.image), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products.title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${controller.productSubTotal[index]} TL",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.removeProductToCart(products);
                      },
                      icon: Icon(
                        Icons.remove_circle,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      )),
                  Text(
                    quantity.toString(),
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProductToCart(products);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(products);
                },
                icon: Icon(
                  Icons.delete,
                  color: Get.isDarkMode ? mainColor : pinkColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
