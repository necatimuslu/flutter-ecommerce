import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eticaret/logic/controllers/cart_controller.dart';
import 'package:eticaret/models/product_model.dart';
import 'package:eticaret/routes/routes.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliders extends StatefulWidget {
  final ProductModel product;
  const ImageSliders({Key? key, required this.product}) : super(key: key);

  @override
  _ImageSlidersState createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  int currentCount = 0;
  int currentColor = 0;
  final List<Color> colorSelected = [
    brownColor,
    brownColor1,
    lightBrownColor,
    lightBrownColor2,
    lightGreenColor,
    brownColor,
    brownColor1,
    lightBrownColor,
  ];
  CarouselController carouselController = CarouselController();
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: 3,
          options: CarouselOptions(
            height: 500,
            autoPlay: true,
            enableInfiniteScroll: false,
            autoPlayInterval: const Duration(seconds: 2),
            onPageChanged: (index, reason) {
              setState(() {
                currentCount = index;
              });
            },
          ),
          itemBuilder: (BuildContext context, int index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.product.image,
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30,
          left: 180,
          child: AnimatedSmoothIndicator(
            activeIndex: currentCount,
            count: 3,
            effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Get.isDarkMode ? pinkColor : mainColor,
                dotColor: Get.isDarkMode ? Colors.black : Colors.white),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 60,
          child: Container(
            height: 200,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.builder(
                itemCount: colorSelected.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentColor = index;
                      });
                    },
                    child: ColorPicker(
                        color: colorSelected[index],
                        outerBorder: currentColor == index),
                  );
                }),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? pinkColor.withOpacity(0.5)
                          : mainColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(25)),
                  child: Icon(
                    Icons.navigate_before,
                    color: Get.isDarkMode
                        ? Colors.white
                        : Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              Obx(
                () => Badge(
                  position: BadgePosition.topEnd(top: -9, end: -13),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    controller.quantity().toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? pinkColor.withOpacity(0.5)
                              : mainColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(25)),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Get.isDarkMode
                            ? Colors.white
                            : Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
