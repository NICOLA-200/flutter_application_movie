import 'package:flutter/material.dart';
import 'package:flutter_application_movie/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        width: 100,
        height: 100,
        alignment:Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(image: 
          AssetImage("assets/splash_image.jpg"))
        ),
      ),
    );
  }
}