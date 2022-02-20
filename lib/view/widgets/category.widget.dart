import 'package:eticaret/logic/controllers/category_controller.dart';

import 'package:eticaret/view/widgets/category_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);
  final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            var category = categoryController.categoryList[index];
            return InkWell(
              onTap: () {
                Get.to(CategoryItems());
                categoryController.getAllCategoryProducts(
                    categoryController.categoryList[index]);
              },
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/cat.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10, top: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      category,
                      style: TextStyle(
                          fontSize: 22,
                          color: Get.isDarkMode
                              ? Colors.black
                              : Colors.black.withOpacity(0.9),
                          backgroundColor: Colors.orange.withOpacity(0.1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (contex, index) => const SizedBox(
                height: 15,
              ),
          itemCount: categoryController.categoryList.length),
    );
  }
}
