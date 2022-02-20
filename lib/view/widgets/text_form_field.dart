// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextFormFiled extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final bool obscureText;
  final Function validator;
  final TextInputType keyboardType;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  AuthTextFormFiled(
      {Key? key,
      required this.controller,
      required this.obscureText,
      required this.keyboardType,
      required this.validator,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: prefixIcon,
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle:
            TextStyle(color: Get.isDarkMode ? Colors.black : Colors.black),
        filled: true,
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
    );
  }
}
