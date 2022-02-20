// ignore_for_file: unused_local_variable
import 'package:http/http.dart' as http;

//import 'package:dio/dio.dart';
import 'package:eticaret/models/product_model.dart';
import 'package:eticaret/utils/string.dart';

class ProductServices {
  static Future<List<ProductModel>> getProducts() async {
    // var dio = Dio();
    List<ProductModel> productsList;
    var response = await http.get(Uri.parse('$baseUrl/products')); // http
    //var response = await dio.get('$baseUrl/products');
    if (response.statusCode == 200) {
      productsList = productModelFromJson(response.body);
      // productsList = productModelFromJson(response.data);

    } else {
      return [];
    }

    return productsList;
  }
}
