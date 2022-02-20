import 'package:eticaret/logic/controllers/cart_controller.dart';
import 'package:eticaret/models/product_model.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCart extends StatelessWidget {
  final ProductModel product;
  AddCart({Key? key, required this.product}) : super(key: key);
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10, top: 5),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtil(
                  text: 'Fiyat',
                  textSize: 17,
                  textColor: Get.isDarkMode
                      ? Colors.grey.withOpacity(0.8)
                      : Colors.grey,
                  fontWeight: FontWeight.bold),
              const SizedBox(
                height: 3,
              ),
              TextUtil(
                  text: '${product.price.toString()} TL',
                  textSize: 18,
                  textColor: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  cartController.addProductToCart(product);
                },
                style: ElevatedButton.styleFrom(
                  primary: Get.isDarkMode ? pinkColor : mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Sepete Ekle',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.shopping_cart_outlined)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
