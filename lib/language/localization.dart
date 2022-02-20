import 'package:eticaret/language/tr.dart';
import 'package:eticaret/language/eng.dart';
import 'package:eticaret/utils/string.dart';
import 'package:get/get.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {tur: tr, ing: eng};
}
