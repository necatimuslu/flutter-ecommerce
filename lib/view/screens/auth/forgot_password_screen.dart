// ignore_for_file: must_be_immutable

import 'package:eticaret/logic/controllers/auth_controller.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/utils/string.dart';
import 'package:eticaret/view/widgets/auth_button.dart';
import 'package:eticaret/view/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  var controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ŞİFRE YENİLE',
            style: TextStyle(color: Get.isDarkMode ? mainColor : pinkColor),
          ),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyColor,
        body: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Şifrenizi yenilemek için lütfen kayıtlı mail adresinizi giriniz',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      fontSize: 14),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20.5,
                ),
                Image.asset(
                  "assets/images/forgot.jpeg",
                  width: 340,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15.5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AuthTextFormFiled(
                    controller: emailController,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return 'Geçerli email adresi giriniz';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.mail),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<AuthController>(builder: (_) {
                  return AuthButton(
                      buttonText: 'Gönder',
                      onPress: () {
                        String email = emailController.text.trim();
                        controller.resetPassword(email: email);
                      });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
