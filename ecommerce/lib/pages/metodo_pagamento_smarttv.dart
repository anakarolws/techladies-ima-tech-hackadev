import 'package:ecommerce/model/dados_produtos.dart';
import 'package:ecommerce/model/smart_tv.dart';
import 'package:flutter/material.dart';

class MetodoPagamentosmartTv extends StatefulWidget {
  final SmartTv smartTv; // Use a classe SmartTV como o tipo do objeto
  const MetodoPagamentosmartTv({Key? key, required this.smartTv})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MetodoPagamentosmartTvState createState() => _MetodoPagamentosmartTvState();
}

class _MetodoPagamentosmartTvState extends State<MetodoPagamentosmartTv> {
  String selecaoPagamentoOpcao = 'À Vista';
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
            items: <String>['À Vista', 'Parcelado']
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
                'Valor à Vista: R\$ ${getSelectedPrice(1)!.toStringAsFixed(2)}'),
        ],
      ),
    );
  }

  double? getSelectedPrice(int installments) {
    double? originalPrice = widget.smartTv.price;
    if (selecaoPagamentoOpcao == 'À Vista') {
      return originalPrice! * 0.9;
    } else if (selecaoPagamentoOpcao == "Parcelado") {
      if (installments <= 3) {
        return originalPrice;
      } else if (installments <= 10) {
        double interestRate = 0.02;
        return originalPrice! * (1 + interestRate);
      }
    }
    return 0.0;
  }

  double getInstallmentValue(double totalPrice, int installments) {
    if (installments <= 0) return 0.0;
    return totalPrice / installments;
  }
}

class SmartphoneList extends StatelessWidget {
  final List<SmartTv> smartphones;

  const SmartphoneList({Key? key, required this.smartphones}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.78,
      ),
      itemCount: smartphones.length,
      itemBuilder: (context, index) {
        return MetodoPagamentosmartTv(
          smartTv: smartTv[index],
        );
      },
    );
  }
}
