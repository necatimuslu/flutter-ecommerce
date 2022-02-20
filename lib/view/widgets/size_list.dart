import 'package:eticaret/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeList extends StatefulWidget {
  const SizeList({Key? key}) : super(key: key);

  @override
  _SizeListState createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];

  var currentSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentSelected = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(left: 4),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                    color: currentSelected == index
                        ? Get.isDarkMode
                            ? pinkColor
                            : mainColor
                        : Get.isDarkMode
                            ? pinkColor.withOpacity(0.4)
                            : mainColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.4), width: 2)),
                child: Text(
                  sizeList[index],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
          itemCount: sizeList.length),
    );
  }
}
