import 'package:eticaret/logic/controllers/auth_controller.dart';

import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/dark_mode_widget.dart';
import 'package:eticaret/view/widgets/language_widget.dart';
import 'package:eticaret/view/widgets/logout.widget.dart';
import 'package:eticaret/view/widgets/profile_image_widget.dart';
import 'package:eticaret/view/widgets/text_util.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ProfileImageWidget(),
          const SizedBox(
            height: 15,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          TextUtil(
              text: 'Yönetim'.tr,
              textSize: 20,
              textColor: Get.isDarkMode ? pinkColor : mainColor,
              fontWeight: FontWeight.bold),
          const SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogoutWidget()
        ],
      ),
    );
  }
}
