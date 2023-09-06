import 'package:ecommerce/model/eletronicos.dart';
import 'package:flutter/material.dart';

class PagamentoSelecao extends StatefulWidget {
  final Eletronicos eletro;

  const PagamentoSelecao({Key? key, required this.eletro}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PagamentoSelecaoState createState() => _PagamentoSelecaoState();
}

class _PagamentoSelecaoState extends State<PagamentoSelecao> {
  String selecaoPagamentoOpcao = 'Á Vista'; // O valor padrão é 'Á Vista'
  int selectedInstallments = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          DropdownButton<String>(
            value: selecaoPagamentoOpcao,
            onChanged: (String? newValue) {
              setState(() {
                selecaoPagamentoOpcao = newValue!;
              });
            },
            items: <String>['Á Vista', 'Parcelado']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          if (selecaoPagamentoOpcao == 'Parcelado')
            DropdownButton<int>(
              value: selectedInstallments,
              onChanged: (int? newValue) {
                setState(() {
                  selectedInstallments = newValue!;
                });
              },
              items: List.generate(3, (index) => index + 1)
                  .map<DropdownMenuItem<int>>((int value) {
                double? price = getSelectedPrice(value);
                String label =
                    '$value x de R\$ ${getInstallmentValue(price!, value).toStringAsFixed(2)}               R\$ ${price.toStringAsFixed(2)}';
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(label),
                );
              }).toList(),
            ),
          if (selecaoPagamentoOpcao == 'À Vista')
            Text(
                'Valor á Vista: R\$ ${getSelectedPrice(1)!.toStringAsFixed(2)}')
        ],
      ),
    );
  }

  double? getSelectedPrice(int installments) {
    double? originalPrice = widget.eletro.price;
    if (selecaoPagamentoOpcao == 'Á Vista') {
      return originalPrice! * 0.9; // Aplicar desconto à vista
    } else if (selecaoPagamentoOpcao == "Parcelado") {
      if (installments <= 3) {
        return originalPrice; // Parcelamento em 3x sem Juros
      } else if (installments <= 10) {
        double interestRate = 0.02; // Parcelas com juros de 4 a 10x
        return originalPrice! * (1 + interestRate);
      }
    }
    return 0.0; // Abaixo de zero parcelas
  }

  double getInstallmentValue(double totalPrice, int installments) {
    if (installments <= 0) return 0.0;
    return totalPrice / installments;
  }
}
