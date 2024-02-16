import 'package:flutter/material.dart';
import 'package:harbor/router.dart'
    as CustomRouter; // Use a unique alias for your custom router

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: CustomRouter
          .Router.generateRoute, // Use the alias with your custom router
    );
  }
}
