import 'package:eticaret/models/product_model.dart';
import 'package:eticaret/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productsList = <ProductModel>[].obs;
  var favoriteProductList = <ProductModel>[].obs;
  var isLoading = true.obs;
  TextEditingController searchTextController = TextEditingController();
  var searchList = <ProductModel>[].obs;
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    getProducts();
    List? productStorage = storage.read<List>('isFavorite');

    if (productStorage != null) {
      favoriteProductList =
          productStorage.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
  }

  void getProducts() async {
    var products = await ProductServices.getProducts();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productsList.addAll(products);
      }
    } finally {
      isLoading.value = false;
    }
  }

  void manageFavorites(int productId) async {
    var existingIndex =
        favoriteProductList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favoriteProductList.removeAt(existingIndex);
      await storage.remove('isFavorite');
    } else {
      favoriteProductList
          .add(productsList.firstWhere((element) => element.id == productId));

      await storage.write('isFavorite', favoriteProductList);
    }
  }

  bool isFavoriteProducts(int productId) {
    return favoriteProductList.any((element) => element.id == productId);
  }

  void addSearchProduct(String searchProduct) {
    searchList.value = productsList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchProduct) ||
          searchPrice.toString().contains(searchProduct);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchProduct('');
  }
}
