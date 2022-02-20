// ignore_for_file: must_be_immutable

import 'package:eticaret/logic/controllers/auth_controller.dart';
import 'package:eticaret/routes/routes.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/utils/string.dart';
import 'package:eticaret/view/widgets/auth_button.dart';

import 'package:eticaret/view/widgets/text_form_field.dart';
import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();
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
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextUtil(
                            text: 'GİRİŞ',
                            textSize: 40,
                            textColor: Get.isDarkMode ? mainColor : pinkColor,
                            fontWeight: FontWeight.bold),
                        const SizedBox(width: 10),
                        TextUtil(
                            text: 'YAP',
                            textSize: 40,
                            textColor:
                                Get.isDarkMode ? mainColor : Colors.white,
                            fontWeight: FontWeight.bold)
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
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
                              hintText: 'Email giriniz',
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
                                obscureText:
                                    controller.isVisibility ? false : true,
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
                                        ? const Icon(
                                            Icons.visibility_off,
                                            color: Colors.black,
                                          )
                                        : const Icon(
                                            Icons.visibility,
                                            color: Colors.black,
                                          )),
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
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPasswordScreen);
                            },
                            child: TextUtil(
                              fontWeight: FontWeight.normal,
                              text: 'Şifrenizi sıfırlayın',
                              textColor:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              textSize: 15,
                              textDecoration: TextDecoration.underline,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        GetBuilder<AuthController>(builder: (_) {
                          return InkWell(
                            onTap: () {
                              controller.remember();
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: const Border(
                                      top: BorderSide(
                                          width: 1, color: Colors.black),
                                      left: BorderSide(
                                          width: 1, color: Colors.black),
                                      right: BorderSide(
                                          width: 1, color: Colors.black),
                                      bottom: BorderSide(
                                          width: 1, color: Colors.black))),
                              child: controller.rememberMe
                                  ? Icon(
                                      Icons.check,
                                      color: Get.isDarkMode
                                          ? mainColor
                                          : pinkColor,
                                    )
                                  : Container(),
                            ),
                          );
                        }),
                        const SizedBox(
                          width: 10,
                        ),
                        TextUtil(
                            text: 'Beni Hatırla',
                            textSize: 18,
                            textColor:
                                Get.isDarkMode ? Colors.black : Colors.white,
                            fontWeight: FontWeight.normal),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthButton(
                          buttonText: 'Giriş',
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              String email = emailController.text.trim();
                              String password = passwordController.text;
                              controller.logInUsingFirebase(
                                  email: email, password: password);
                            }
                          });
                    }),
                    const SizedBox(height: 20),
                    TextUtil(
                        text: 'Veya',
                        textSize: 20,
                        textColor: Get.isDarkMode ? mainColor : Colors.white,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.facebookSignUpApp();
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.facebook,
                              size: 40,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {
                                controller.googleSignUpApp();
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.google,
                                size: 40,
                                color: Colors.red,
                              )),
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            TextUtil(
                                text: 'Hesabınız yok mu?',
                                textSize: 15,
                                textColor: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.normal),
                            TextButton(
                                onPressed: () {
                                  Get.offNamed(Routes.signUpScreen);
                                },
                                child: TextUtil(
                                  text: 'Kayıt için tıklayınız',
                                  textSize: 15,
                                  textColor:
                                      Get.isDarkMode ? mainColor : Colors.white,
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
    ));
  }
}
