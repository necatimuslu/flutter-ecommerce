import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final Function() onPress;
  const AuthButton({Key? key, required this.buttonText, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Get.isDarkMode ? mainColor : pinkColor,
          minimumSize: const Size(360, 50)),
      onPressed: onPress,
      child: TextUtil(
          text: buttonText,
          textSize: 18,
          textColor: Colors.white,
          fontWeight: FontWeight.bold),
    );
  }
}
