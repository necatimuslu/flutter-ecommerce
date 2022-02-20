// ignore_for_file: must_be_immutable

import 'package:eticaret/logic/controllers/auth_controller.dart';
import 'package:eticaret/routes/routes.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/utils/string.dart';
import 'package:eticaret/view/widgets/auth_button.dart';
import 'package:eticaret/view/widgets/check.dart';
import 'package:eticaret/view/widgets/text_form_field.dart';
import 'package:eticaret/view/widgets/text_util.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyColor,
        elevation: 0,
      ),
      backgroundColor: Get.isDarkMode ? Colors.white : darkGreyColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtil(
                              text: 'KAYIT ',
                              textSize: 40,
                              textColor: Get.isDarkMode ? mainColor : pinkColor,
                              fontWeight: FontWeight.w500),
                          TextUtil(
                              text: 'OL ',
                              textSize: 40,
                              textColor:
                                  Get.isDarkMode ? mainColor : Colors.white,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      AuthTextFormFiled(
                        controller: nameController,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return "Geçerli kullanıcı adı giriniz ";
                          } else {
                            return null;
                          }
                        },
                        hintText: 'Kullanıcı adı',
                        prefixIcon: Get.isDarkMode
                            ? const FaIcon(
                                FontAwesomeIcons.user,
                                color: Colors.black,
                              )
                            : const FaIcon(
                                FontAwesomeIcons.user,
                                color: mainColor,
                              ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AuthTextFormFiled(
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
                        hintText: 'Email adresi',
                        prefixIcon: Get.isDarkMode
                            ? const FaIcon(
                                FontAwesomeIcons.addressCard,
                                color: Colors.black,
                              )
                            : const FaIcon(
                                FontAwesomeIcons.addressCard,
                                color: mainColor,
                              ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthTextFormFiled(
                          controller: passwordController,
                          obscureText: controller.isVisibility ? false : true,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return 'Şifre en az 6 karekterli olmalıdır';
                            } else {
                              return null;
                            }
                          },
                          hintText: 'Şifre',
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibility
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          prefixIcon: Get.isDarkMode
                              ? const FaIcon(
                                  FontAwesomeIcons.pauseCircle,
                                  color: Colors.black,
                                )
                              : const FaIcon(
                                  FontAwesomeIcons.pauseCircle,
                                  color: mainColor,
                                ),
                        );
                      }),
                      const SizedBox(
                        height: 30,
                      ),
                      CheckWidget(
                        text: 'Gizlilik sözleşmesi',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthButton(
                          buttonText: 'Kayıt ol',
                          onPress: () {
                            if (controller.isCheckBox == false) {
                              Get.snackbar('Sözleşme',
                                  'Lütfen gizlilik sözleşmesini onaylayınız.',
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.white,
                                  backgroundColor: Colors.green);
                            } else if (formKey.currentState!.validate()) {
                              String name = nameController.text.trim();
                              String email = emailController.text.trim();
                              String password = passwordController.text;
                              controller.signUpUsingFirebase(
                                  name: name, email: email, password: password);

                              controller.isCheckBox = true;
                            }
                          },
                        );
                      }),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              TextUtil(
                                  text: 'Hesabınız var mı?',
                                  textSize: 15,
                                  textColor: Get.isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.normal),
                              TextButton(
                                  onPressed: () {
                                    Get.offNamed(Routes.loginScreen);
                                  },
                                  child: TextUtil(
                                    text: 'Giriş için tıklayınız',
                                    textSize: 15,
                                    textColor: Get.isDarkMode
                                        ? mainColor
                                        : Colors.white,
                                    fontWeight: FontWeight.normal,
                                    textDecoration: TextDecoration.underline,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
