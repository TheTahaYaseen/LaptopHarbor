// Product model class
class ProductModel {
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  final String brandName;

  ProductModel({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.brandName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      price: json['price'].toDouble(),
      brandName: json['brandName'],
    );
  }
}
