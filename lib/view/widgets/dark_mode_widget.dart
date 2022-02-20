import 'package:eticaret/logic/controllers/setting_controller.dart';
import 'package:eticaret/logic/controllers/theme.controller.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Switch(
            activeColor: Get.isDarkMode ? pinkColor : mainColor,
            activeTrackColor: Get.isDarkMode ? pinkColor : mainColor,
            value: controller.switchValue.value,
            onChanged: (value) {
              ThemeController().changeTheme();
              controller.switchValue.value = value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: darkSettings),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtil(
            text: 'Gece Modu'.tr,
            textSize: 22,
            textColor: Get.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
