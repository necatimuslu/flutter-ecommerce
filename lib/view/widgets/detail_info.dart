import 'package:eticaret/logic/controllers/product_controller.dart';
import 'package:eticaret/models/product_model.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class DetailInfo extends StatelessWidget {
  final ProductModel product;

  DetailInfo({
    Key? key,
    required this.product,
  }) : super(key: key);
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 6, left: 6, bottom: 2),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? Colors.white.withOpacity(0.4)
                            : Colors.grey.withOpacity(0.2),
                        shape: BoxShape.circle),
                    child: Obx(() {
                      return InkWell(
                        onTap: () {
                          controller.manageFavorites(product.id);
                        },
                        child: controller.isFavoriteProducts(product.id)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              ),
                      );
                    })),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                TextUtil(
                    text: product.rating.rate.toString(),
                    textSize: 14,
                    textColor: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),
                const SizedBox(
                  width: 5,
                ),
                RatingBar.builder(
                  itemSize: 22,
                  initialRating: product.rating.rate,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    debugPrint(rating.toString());
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ReadMoreText(
              product.description,
              trimLines: 3,
              textAlign: TextAlign.justify,
              trimCollapsedText: 'Daha fazlası',
              trimExpandedText: 'Daha az',
              lessStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? pinkColor : mainColor),
              moreStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? pinkColor : mainColor),
              style: TextStyle(
                  fontSize: 14,
                  height: 2,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
