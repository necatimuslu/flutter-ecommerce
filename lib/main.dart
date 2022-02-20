import 'package:eticaret/language/localization.dart';
import 'package:eticaret/logic/controllers/theme.controller.dart';
import 'package:eticaret/routes/routes.dart';
import 'package:eticaret/utils/string.dart';
import 'package:eticaret/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ETicaret',
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>('lang').toString()),
      translations: LocalizationApp(),
      fallbackLocale: Locale(tur),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeData,
      initialRoute: AppRoutes.initialRouteControl,
      getPages: AppRoutes.routes,
    );
  }
}
