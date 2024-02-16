// Product service class
import 'package:harbor/api_client/api_client.dart';
import 'package:harbor/model/product_model.dart';

class ProductService {
  final ApiClient _apiClient = ApiClient();

  Future<List<ProductModel>> getProducts() async {
    try {
      return await _apiClient.fetchProducts();
    } catch (e) {
      throw e;
    }
  }
}
