import 'package:eticaret/logic/controllers/auth_controller.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  final String text;
  CheckWidget({Key? key, required this.text}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<AuthController>(builder: (_) {
          return InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.isCheckBox
                    ? Icon(
                        Icons.check,
                        color: Get.isDarkMode ? mainColor : pinkColor,
                        size: 30,
                      )
                    : Container()),
          );
        }),
        const SizedBox(
          width: 10,
        ),
        TextUtil(
            text: text,
            textSize: 16,
            textColor: Get.isDarkMode ? Colors.black : Colors.white,
            fontWeight: FontWeight.normal),
        TextButton(
            onPressed: () {},
            child: const TextUtil(
              fontWeight: FontWeight.normal,
              text: 'Detay için tıklayınız',
              textSize: 16,
              textColor: mainColor,
              textDecoration: TextDecoration.underline,
            ))
      ],
    );
  }
}
