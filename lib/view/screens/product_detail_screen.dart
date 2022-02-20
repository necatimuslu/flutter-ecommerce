import 'package:eticaret/models/product_model.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/add_cart.dart';
import 'package:eticaret/view/widgets/detail_info.dart';
import 'package:eticaret/view/widgets/image_sliders.dart';
import 'package:eticaret/view/widgets/size_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text('Ürün Detay'),
          backgroundColor: Get.isDarkMode ? pinkColor : mainColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(product: product),
              const SizeList(),
              DetailInfo(product: product),
              AddCart(
                product: product,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
