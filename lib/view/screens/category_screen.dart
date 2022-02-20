import 'package:eticaret/view/widgets/category.widget.dart';
import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextUtil(
                  text: 'Kategoriler',
                  textSize: 30,
                  textColor: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
