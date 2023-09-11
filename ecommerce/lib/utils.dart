import 'package:intl/intl.dart';

String formatPrice({required double price}) {
  return NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  ).format(price);
}
