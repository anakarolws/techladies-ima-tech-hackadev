import 'package:ecommerce/utils.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final double price;
  final int fontSize;
  final Color color;

  const PriceWidget(
      {super.key,
      required this.price,
      required this.color,
      this.fontSize = 12});

  @override
  Widget build(BuildContext context) {
    final formattedPrice = formatPrice(price:price);

    return Text(
      formattedPrice,
      style: TextStyle(
        fontSize: fontSize.toDouble(),
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
