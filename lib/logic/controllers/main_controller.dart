import 'package:eticaret/view/screens/category_screen.dart';
import 'package:eticaret/view/screens/favorites_screen.dart';
import 'package:eticaret/view/screens/home_screen.dart';
import 'package:eticaret/view/screens/setting_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ].obs;

  final title = ['Anasayfa', 'Kategoriler', 'Favoriler', 'Ayarlar'].obs;
}
