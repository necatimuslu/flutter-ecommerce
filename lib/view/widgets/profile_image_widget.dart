import 'package:eticaret/logic/controllers/auth_controller.dart';
import 'package:eticaret/logic/controllers/setting_controller.dart';
import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImageWidget extends StatelessWidget {
  ProfileImageWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(authController.displayPhotoUser.value),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtil(
                      text: controller
                          .capitalize(authController.displayName.value),
                      textSize: 20,
                      textColor: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w700),
                  const SizedBox(
                    height: 5,
                  ),
                  TextUtil(
                      text: authController.displayUserEmail.value,
                      textSize: 16,
                      textColor: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w700),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
