import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/cart_items.dart';
import 'package:eticaret/view/widgets/search_form.text.dart';
import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyColor : mainColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular((20)),
                    bottomRight: Radius.circular((20))),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextUtil(
                        text: 'Ürün ara',
                        textSize: 24,
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      height: 5,
                    ),
                    const TextUtil(
                        text: 'YAZI GELECEK',
                        textSize: 30,
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      height: 20,
                    ),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtil(
                    text: 'Kategoriler',
                    textSize: 30,
                    textColor: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CartItems(),
          ],
        ),
      ),
    );
  }
}
