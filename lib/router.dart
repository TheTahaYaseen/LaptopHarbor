import 'package:flutter/material.dart';
import 'package:harbor/ui/splash_view.dart';
// Replace 'your_project_name' with your actual project name

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashView());
      // Add more routes here as needed
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}'))));
    }
  }
}
