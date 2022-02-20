import 'package:eticaret/logic/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({Key? key}) : super(key: key);
  final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (_) => TextField(
        controller: productController.searchTextController,
        onChanged: (value) {
          productController.addSearchProduct(value);
        },
        decoration: InputDecoration(
          focusColor: Colors.red,
          fillColor: Colors.white,
          hintText: 'Ürün ara',
          hintStyle: const TextStyle(color: Colors.black45),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          suffixIcon: productController.searchTextController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    productController.clearSearch();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
