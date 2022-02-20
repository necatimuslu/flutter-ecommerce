import 'package:flutter/material.dart';

class TextUtil extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextDecoration? textDecoration;
  const TextUtil(
      {Key? key,
      required this.text,
      required this.textSize,
      required this.textColor,
      required this.fontWeight,
      this.textDecoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          decoration: textDecoration,
          fontSize: textSize,
          fontWeight: fontWeight,
          color: textColor),
    );
  }
}
