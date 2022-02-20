import 'package:eticaret/routes/routes.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Sepetiniz ',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Boş',
                style: TextStyle(
                    color: Get.isDarkMode ? pinkColor : mainColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
          ])),
          const SizedBox(
            height: 15,
          ),
          TextUtil(
              text: "Ürün ekleyerek alışveriş'in keyfini çıkarabilirsin",
              textSize: 15,
              textColor: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {
              Get.offNamed(Routes.mainScreen);
            },
            style: ElevatedButton.styleFrom(
              primary: Get.isDarkMode ? pinkColor : mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: TextUtil(
                  text: 'Anasayfa',
                  textSize: 28,
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
