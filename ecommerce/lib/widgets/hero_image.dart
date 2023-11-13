import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final String tag;
  final String image;

  const HeroImage({Key? key, required this.tag, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Image.network(
          image,
          height: 120,
          width: 120,
        ),
      ),
    );
  }
}