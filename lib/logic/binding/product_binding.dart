import 'package:eticaret/logic/controllers/cart_controller.dart';
import 'package:eticaret/logic/controllers/product_controller.dart';
import 'package:get/instance_manager.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
  }
}
