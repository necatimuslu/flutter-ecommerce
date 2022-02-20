// ignore_for_file: must_be_immutable

import 'package:eticaret/routes/routes.dart';

import 'package:eticaret/utils/theme.dart';

import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "assets/images/login.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 220,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: TextUtil(
                        text: 'Hoşgeldiniz',
                        textSize: 35,
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                      height: 60,
                      width: 240,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          TextUtil(
                              text: 'E-',
                              textSize: 35,
                              textColor: mainColor,
                              fontWeight: FontWeight.bold),
                          SizedBox(
                            width: 7,
                          ),
                          TextUtil(
                              text: 'Ticaret',
                              textSize: 35,
                              textColor: Colors.white,
                              fontWeight: FontWeight.bold)
                        ],
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 40),
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Get.offNamed(Routes.loginScreen);
                      },
                      child: const TextUtil(
                        fontWeight: FontWeight.bold,
                        textColor: Colors.white,
                        text: 'Şimdi başla',
                        textSize: 18,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextUtil(
                          text: 'Hesabınız yok mu?',
                          textSize: 15,
                          textColor: Colors.white,
                          fontWeight: FontWeight.normal),
                      TextButton(
                          onPressed: () {
                            Get.offNamed(Routes.signUpScreen);
                          },
                          child: const TextUtil(
                            fontWeight: FontWeight.normal,
                            text: 'Kayıt olmak için tıklayınız',
                            textColor: mainColor,
                            textSize: 15,
                            textDecoration: TextDecoration.underline,
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
