import 'package:eticaret/models/category_model.dart';
import 'package:eticaret/models/product_model.dart';
import 'package:eticaret/utils/string.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static Future<List<String>> getCategories() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    List<String> responseData = categoryModelFromJson(response.body);

    return responseData;
  }
}

class CategoryProductService {
  static Future<List<ProductModel>> getCategoryProducts(
      String categoryName) async {
    List<ProductModel> productsList;
    var response = await http
        .get(Uri.parse('$baseUrl/products/category/$categoryName')); // http

    if (response.statusCode == 200) {
      productsList = productModelFromJson(response.body);
    } else {
      return [];
    }

    return productsList;
  }
}
