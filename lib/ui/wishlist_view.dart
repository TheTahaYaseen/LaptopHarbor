import 'package:flutter/material.dart';
import 'package:harbor/model/product_model.dart'; // Import the ProductModel class

class WishlistView extends StatefulWidget {
  final List<ProductModel> wishlist; // List to hold wishlist items

  const WishlistView({Key? key, required this.wishlist}) : super(key: key);

  @override
  _WishlistViewState createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'), // Set app bar title
      ),
      body: ListView.builder(
        itemCount: widget.wishlist.length, // Number of items in wishlist
        itemBuilder: (context, index) {
          ProductModel product =
              widget.wishlist[index]; // Get product at current index
          return ListTile(
            leading: Image.network(
              product.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text(product.name), // Product name
            subtitle: Text('\$${product.price}'), // Product price
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Remove product from wishlist
                setState(() {
                  widget.wishlist.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
