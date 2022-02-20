import 'package:eticaret/logic/controllers/main_controller.dart';
import 'package:eticaret/logic/controllers/setting_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
  }
}
