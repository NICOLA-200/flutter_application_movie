import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imageAsset;
  final String title;

  CustomCard({super.key, required this.imageAsset, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: NetworkImage(imageAsset), // Changed to NetworkImage
          fit: BoxFit.cover,
        ),
      ),
      margin: const EdgeInsets.only(left: 35, right: 35, top: 30, bottom: 30),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
