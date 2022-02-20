import 'package:eticaret/logic/controllers/cart_controller.dart';
import 'package:eticaret/routes/routes.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const TextUtil(
                    text: 'Toplam',
                    textSize: 17,
                    textColor: Colors.grey,
                    fontWeight: FontWeight.bold),
                const SizedBox(
                  height: 5,
                ),
                TextUtil(
                    text: '${controller.totalPrice} TL',
                    textSize: 20,
                    textColor: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.paymentScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Get.isDarkMode ? pinkColor : mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextUtil(
                          text: 'Ödeme',
                          textSize: 25,
                          textColor: Colors.white,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.payment),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
