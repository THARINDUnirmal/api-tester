import 'dart:convert';

import 'package:api_tester/api/urls.dart';
import 'package:api_tester/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // Fetch all products from the API
  Future<List<ProductModel>> getAllData() async {
    String url = ApiUril.baseUrl;

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        // Map each item to a ProductModel instance
        List<ProductModel> allProductData =
            data.map((item) => ProductModel.fromJson(item)).toList();

        print(allProductData);

        return allProductData;
      } else {
        print("Failed to fetch products. Status code: ${response.statusCode}");
        throw Exception("Failed to fetch products");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Failed to fetch products");
    }
  }
}
