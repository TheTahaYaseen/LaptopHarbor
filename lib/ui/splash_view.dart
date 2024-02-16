import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harbor/ui/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {
    super.initState();
    // Add a delay to simulate a splash screen effect
    Timer(
      Duration(seconds: 9),
      () {
        // Navigate to the next screen or home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B262C),
      body: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
}
