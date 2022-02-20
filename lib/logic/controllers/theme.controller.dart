import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final key = 'isDarkModes';

  saveThemeData(bool isDark) {
    boxStorage.write(key, isDark);
  }

  bool getThemeData() {
    return boxStorage.read<bool>(key) ?? false;
  }

  ThemeMode get themeData => getThemeData() ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    Get.changeThemeMode(getThemeData() ? ThemeMode.light : ThemeMode.dark);

    saveThemeData(!getThemeData());
  }
}
