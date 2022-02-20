import 'package:eticaret/utils/string.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var langLocal = tur;

  String capitalize(String prfileName) {
    return prfileName.split(' ').map((name) => name.capitalize).join(' ');
  }

  @override
  void onInit() async {
    super.onInit();
    langLocal = await getLanguage;
  }

  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
  }

  Future<String> get getLanguage async {
    return await storage.read('lang');
  }

  void changeLanguage(String language) {
    if (langLocal == language) {
      return;
    }

    if (language == ing) {
      langLocal = ing;
      saveLanguage(ing);
    } else {
      langLocal = tur;
      saveLanguage(tur);
    }
    update();
  }
}
