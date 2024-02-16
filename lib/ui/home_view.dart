import 'package:flutter/material.dart';
import 'package:harbor/model/product_model.dart';
import 'package:harbor/ui/home_viewmodel.dart';
import 'package:harbor/ui/register_view.dart';

class HomeView extends StatelessWidget {
  final String userName;

  const HomeView({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GlobalKey to control the Scaffold
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    // Instance of HomeViewModel to fetch products
    HomeViewModel viewModel = HomeViewModel();

    return Scaffold(
      key: _scaffoldKey, // Assigning GlobalKey to Scaffold
      // Drawer for navigation menu
      drawer: Drawer(
        child: Container(
          color: Color(0xff1B262C),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.0),
              // Close button in the drawer header
              Row(
                children: [
                  SizedBox(width: 240.0),
                  IconButton(
                    icon: Icon(Icons.menu_open_rounded),
                    color: Color(0xffF5F8FB),
                    onPressed: () {
                      _scaffoldKey.currentState
                          ?.openDrawer(); // Open drawer on button press
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              // User information section in drawer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/profile.png"),
                  ),
                  Column(
                    children: [
                      Text(
                        "$userName",
                        style:
                            TextStyle(color: Color(0xffF5F8FB), fontSize: 24),
                      ),
                      Row(
                        children: [
                          Text(
                            "Verified Profile",
                            style: TextStyle(
                                color: Color(0xff8F959E), fontSize: 14),
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                                color: Color(0xff34C759), fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: 70.0,
                      height: 30.0,
                      color: Color(0xff222E34),
                      child: Center(
                        child: Text(
                          "3 Orders",
                          style: TextStyle(color: Color(0xff8F959E)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // More Drawer items as needed
            ],
          ),
        ),
      ),
      // Body section with FutureBuilder to fetch and display products
      body: FutureBuilder<List<ProductModel>>(
        future: viewModel.fetchProducts(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while fetching data
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show error message if data fetching fails
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Display fetched products in a ListView
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                ProductModel product = snapshot.data![index];
                return Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Positioned.fill(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    product.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                icon: Icon(
                                  Icons.favorite_outline,
                                  color: Color(0xff8F959E),
                                ),
                                onPressed: () {
                                  // Add logic to handle wishlist
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              color: Color(0xffF5F8FB),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            product.description,
                            style: TextStyle(
                              color: Color(0xffF5F8FB),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "\$${product.price.toString()}",
                            style: TextStyle(
                              color: Color(0xffF5F8FB),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                );
              },
            );
          }
        },
      ),
      // Floating Action Button to navigate to WishlistView
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WishlistView(),
            ),
          );
        },
        child: Icon(Icons.favorite),
      ),
    );
  }
}
