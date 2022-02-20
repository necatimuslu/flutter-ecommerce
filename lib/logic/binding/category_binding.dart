import 'package:eticaret/logic/controllers/category_controller.dart';
import 'package:get/get.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
  }
}
