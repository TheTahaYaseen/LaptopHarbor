// Product viewmodel class
import 'package:harbor/model/product_model.dart';
import 'package:harbor/services/product_services.dart';

class HomeViewModel {
  final ProductService _productService = ProductService();

  Future<List<ProductModel>> fetchProducts() async {
    try {
      return await _productService.getProducts();
    } catch (e) {
      throw e;
    }
  }
}
