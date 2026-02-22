import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,

    required this.image,
    required this.heightImage,

    required this.widthImage,
  });

  final String image;
  final double widthImage;
  final double heightImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthImage,
      height: heightImage,
      child: Image.asset(image, fit: BoxFit.cover),
    );
  }
}
