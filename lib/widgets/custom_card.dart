import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  String imageAsset;
    CustomCard({super.key,required this.imageAsset });

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(image: AssetImage(imageAsset),fit: BoxFit.cover)
          ),
          margin: const EdgeInsets.only(left:35, right: 35, top: 30, bottom: 30),
    );
  }
}
