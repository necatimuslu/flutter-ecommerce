import 'package:eticaret/logic/controllers/setting_controller.dart';
import 'package:eticaret/utils/string.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: languageSettings),
                  child: const Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextUtil(
                  text: 'Dil Seçiniz'.tr,
                  textSize: 22,
                  textColor: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  width: 2),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: controller.langLocal,
                onChanged: (val) {
                  controller.changeLanguage(val!);
                  Get.updateLocale(Locale(val));
                },
                iconSize: 25,
                icon: const Icon(Icons.arrow_drop_down),
                items: [
                  DropdownMenuItem(
                    value: ing.tr,
                    child: Text(
                      english,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  DropdownMenuItem(
                    value: tur.tr,
                    child: Text(
                      turkish,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
