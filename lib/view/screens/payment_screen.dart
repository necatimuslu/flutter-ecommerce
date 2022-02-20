import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/delivery_container.widget.dart';
import 'package:eticaret/view/widgets/payment_method.dart';
import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? pinkColor : mainColor,
        title: const Text(
          'Ödeme',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextUtil(
                text: 'Genel Bilgiler  ',
                textSize: 24,
                textColor: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              const DeliveryContainerWidget(),
              const SizedBox(
                height: 20,
              ),
              TextUtil(
                text: 'Ödeme Türü  ',
                textSize: 24,
                textColor: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              const PaymentMethod(),
              const SizedBox(
                height: 10,
              ),
              TextUtil(
                  text: 'Toplam : 150 TL',
                  textSize: 20,
                  textColor: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        primary: Get.isDarkMode ? pinkColor : mainColor),
                    onPressed: () {},
                    child: Row(
                      children: const [
                        FaIcon(FontAwesomeIcons.moneyBill),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Onayla',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
