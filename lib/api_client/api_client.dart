import 'package:harbor/model/product_model.dart';
import 'package:harbor/uitls/api_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  // Replace with your API base URL

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.baseUrl +
            ApiConstants
                .login), // Replace '/login' with your actual login endpoint
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      // Check if the server returns a 200 OK response
      if (response.statusCode == 200) {
        // If successful, return the response body
        return jsonDecode(response.body);
      } else {
        // If an error occurs, throw an exception with the status code
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      // If an error occurs during the HTTP request, throw an exception
      throw Exception('Failed to login: $e');
    }
  }

  Future<Map<String, dynamic>> register(
      String email, String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.register),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to register: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.product),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
