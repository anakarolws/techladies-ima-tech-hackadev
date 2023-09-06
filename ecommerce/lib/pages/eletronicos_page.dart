import 'package:ecommerce/model/dados_produtos.dart';
import 'package:ecommerce/model/eletronicos.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class EletronicosPagePrice extends StatefulWidget {
  final Eletronicos eletronico;

  const EletronicosPagePrice({super.key, required this.eletronico});

  @override
  State<EletronicosPagePrice> createState() => _EletronicosPagePriceState();
}

class _EletronicosPagePriceState extends State<EletronicosPagePrice> {
  String selecaoPagamentoOpcao = 'À Vista'; // o Valor padrão é á vista
  int selectedInstallments = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side:
            const BorderSide(color: Color.fromRGBO(109, 68, 166, 1), width: 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(109, 68, 166, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "-${widget.eletronico.discount}%",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const LikeButton(
                  animationDuration: Duration(seconds: 0),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Image.asset(
                widget.eletronico.image!,
                height: 120,
                width: 140,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.eletronico.title!,
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(109, 68, 166, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    DropdownButton<String>(
                      value: selecaoPagamentoOpcao,
                      onChanged: (String? value) {
                        setState(() {
                          selecaoPagamentoOpcao = value!;
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
                          'Valor á Vista: R\$ ${getSelectedPrice(1)!.toStringAsFixed(2)}'),
                  ],
                ),
                const Icon(Icons.shopping_cart_checkout,
                    color: Color.fromRGBO(109, 68, 166, 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double? getSelectedPrice(int installments) {
    double? originalPrice = widget.eletronico.price;
    if (selecaoPagamentoOpcao == 'À Vista') {
      return originalPrice! * 0.9; //Aplicar desconto á vista
    } else if (selecaoPagamentoOpcao == "Parcelado") {
      if (installments <= 3) {
        return originalPrice; // Parcelamento em 3x sem Juros
      } else if (installments <= 10) {
        double interestRate = 0.02; //parcelas com juros de 4 a 10x
        return originalPrice! * (1 + interestRate);
      }
    }
    return 0.0; // abaixo de zero parcelas
  }

  double getInstallmentValue(double totalPrice, int installments) {
    if (installments <= 0) return 0.0;
    return totalPrice / installments;
  }
}

class EletronicosList extends StatelessWidget {
  final List<Eletronicos> eletros;

  const EletronicosList({super.key, required this.eletros});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.78),
      itemCount: eletros.length,
      itemBuilder: (context, index) {
        return EletronicosPagePrice(
          eletronico: eletros[index],
        );
      },
    );
  }
}

class EletronicosPage extends StatelessWidget {
  const EletronicosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Color.fromRGBO(109, 68, 166, 1),
          ),
          title: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Eletrônicos",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(109, 68, 166, 1),
              ),
            ),
          ),
        ),
        body: EletronicosList(
          eletros: eletronicos,
        ));
  }
}
