import 'package:ecommerce/model/dados_produtos.dart';
import 'package:ecommerce/model/smart_phone.dart';
import 'package:ecommerce/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class MetodoPagamentoSmartphone extends StatefulWidget {
  final SmartPhone smartphone; // Use a classe SmartPhone como o tipo do objeto
  const MetodoPagamentoSmartphone({Key? key, required this.smartphone})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MetodoPagamentoSmartphoneState createState() =>
      _MetodoPagamentoSmartphoneState();
}

class _MetodoPagamentoSmartphoneState extends State<MetodoPagamentoSmartphone> {
  String selecaoPagamentoOpcao = 'À Vista'; // Opção de pagamento inicialmente definida como À Vista
  int selectedInstallments = 1; // Número de parcelas inicialmente definido como 1

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
    double? originalPrice = widget.smartphone.price;
    if (selecaoPagamentoOpcao == 'À Vista') {
      return originalPrice! * 0.9; // Se a opção for À Vista, aplica-se um desconto de 10%
    } else if (selecaoPagamentoOpcao == "Parcelado") {
      if (installments <= 3) {
        return originalPrice; // Se parcelado em 3 vezes ou menos, o preço não sofre alteração
      } else if (installments <= 10) {
        double interestRate = 0.02; // Taxa de juros para parcelamento acima de 3 vezes
        return originalPrice! * (1 + interestRate); // Aplica-se a taxa de juros
      }
    }
    return 0.0;
  }

  double getInstallmentValue(double totalPrice, int installments) {
    if (installments <= 0) return 0.0;
    return totalPrice / installments; // Calcula o valor da parcela
  }
}

class SmartphoneList extends StatelessWidget {
  final List<SmartPhone> smartphones;

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
        return MetodoPagamentoSmartphone(
          smartphone: smartphones[index],
        );
      },
    );
  }
}

class SmartphonePage extends StatelessWidget {
  
  const SmartphonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Smartphones",
      ),
      body: SmartphoneList(
        smartphones: smartphones,
      ),
    );
  }
}
