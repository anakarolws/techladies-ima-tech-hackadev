import 'package:ecommerce/utils.dart';
import 'package:flutter/material.dart';


class PriceInstallmentWidget extends StatelessWidget {
  final double price;
  final int fontSize;
  final Color color;

  const PriceInstallmentWidget(
      {super.key,
      required this.price,
      required this.color,
      this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    String priceParcela = _getParcelamento(); // resgatar o conteúdo de parcelas

    return Text(
      priceParcela,
      style: TextStyle(
        fontSize: fontSize.toDouble(),
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  String _getParcelamento() {
    double pricePart;
    int maxParts;

    if (price <= 200) {
      pricePart = price / 3;
      maxParts = 3;
    } else if (price <= 500) {
      pricePart = price / 5;
      maxParts = 5;
    } else {
      pricePart = price / 10;
      maxParts = 10;
    }

    String formattedPrice = formatPrice(price: pricePart);
    return 'Parcela em ${maxParts}x de $formattedPrice';
  }
}
