import 'package:eticaret/models/product_model.dart';
import 'package:eticaret/services/category_service.dart';

import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryList = <String>[].obs;
  var categoryProductList = <ProductModel>[].obs;
  var isLoading = false.obs;
  var isCategoryProductLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    var categories = await CategoryService.getCategories();

    try {
      isLoading(true);
      if (categories.isNotEmpty) {
        categoryList.addAll(categories);
      }
    } finally {
      isLoading.value = false;
    }
  }

  void getAllCategoryProducts(String categoryName) async {
    var allCategoryProducts =
        await CategoryProductService.getCategoryProducts(categoryName);

    try {
      isCategoryProductLoading(true);
      if (allCategoryProducts.isNotEmpty) {
        categoryProductList.value = allCategoryProducts;
      }
    } finally {
      isCategoryProductLoading.value = false;
    }
  }
}
