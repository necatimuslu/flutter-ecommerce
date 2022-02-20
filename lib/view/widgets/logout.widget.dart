import 'package:eticaret/logic/controllers/auth_controller.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutWidget extends StatelessWidget {
  LogoutWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Get.isDarkMode
          ? pinkColor.withOpacity(0.8)
          : mainColor.withOpacity(0.8),
      customBorder: const StadiumBorder(),
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Get.defaultDialog(
            title: 'Çıkış'.tr,
            titleStyle: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            backgroundColor: Colors.orange.shade100,
            buttonColor: Get.isDarkMode ? pinkColor : mainColor,
            middleText: 'Çıkış yapmak istediğinizden emin misiniz ?',
            middleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
            cancelTextColor: Colors.red.shade200,
            onConfirm: () {
              controller.signOut();
            },
            textConfirm: 'Evet',
            confirmTextColor: Colors.blue.shade200,
            textCancel: 'Hayır',
            radius: 15,
            onCancel: () {
              Get.back();
            });
      },
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: logoutSettings),
                  child: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextUtil(
                  text: 'Çıkış',
                  textSize: 22,
                  textColor: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
