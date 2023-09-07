import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'package:ecommerce/model/dados_produtos.dart';
import 'package:ecommerce/model/smart_tv.dart'; // Importe a classe SmartTv
import 'package:ecommerce/widgets/custom_appbar.dart';

import 'package:ecommerce/widgets/hero_details.dart';
import 'package:ecommerce/widgets/hero_image.dart';

class SmartTvPrice extends StatefulWidget {
  final SmartTv smartTv; // Corrigido para SmartTv
  final int index;

  // Corrigido: Remova "super.key" e adicione "Key? key"
  const SmartTvPrice({Key? key, required this.smartTv, required this.index})
      : super(key: key);

  @override
  State<SmartTvPrice> createState() => _SmartTvPriceState();
}

class _SmartTvPriceState extends State<SmartTvPrice> {
  final String tagImage = 'hero-smarttv';
  DetalhesPage detalhesPage = DetalhesPage();

  String selecaoPagamentoOpcao = 'À Vista';
  int selectedInstallments = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => detalhesPage.detalhesCategoria(context, smartTv, widget.index, tagImage),
        child: Card(
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
                    "-${widget.smartTv.discount}%", // Corrigido para smartTv
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
            child: HeroImage(
                tag: "$tagImage-$widget.index", image: widget.smartTv.image!),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.smartTv.title!, // Corrigido para smartTv
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
                          'Valor à Vista: R\$ ${getSelectedPrice(1)!.toStringAsFixed(2)}'),
                  ],
                ),
                const Icon(Icons.shopping_cart_checkout,
                    color: Color.fromRGBO(109, 68, 166, 1)),
              ],
            ),
          ),
        ],
      ),
    )
    );
  }

  double? getSelectedPrice(int installments) {
    double? precoOriginal = widget.smartTv.price; // Corrigido para smartTv
    if (selecaoPagamentoOpcao == 'À Vista') {
      return precoOriginal! * 0.9;
    } else if (selecaoPagamentoOpcao == "Parcelado") {
      if (installments <= 3) {
        return precoOriginal; // Corrigido para precoOriginal
      } else if (installments <= 10) {
        double taxaDeJuros = 0.02;
        return precoOriginal! *
            (1 + taxaDeJuros); // Corrigido para precoOriginal
      }
    }
    return 0.0;
  }

  double getInstallmentValue(double precoTotal, int installments) {
    if (installments <= 0) return 0.0;
    return precoTotal / installments;
  }
}

class SmartTvList extends StatelessWidget {
  final List<SmartTv> smartTvs; // Corrigido para smartTvs

  const SmartTvList({Key? key, required this.smartTvs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.78),
      itemCount: smartTvs.length, // Corrigido para smartTvs
      itemBuilder: (context, index) {
        return SmartTvPrice(
          smartTv: smartTvs[index], // Corrigido para smartTv
          index: index,
        );
      },
    );
  }
}

class SmartTvPage extends StatelessWidget {
  const SmartTvPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = "Smart TVs";

    return Scaffold(
      appBar: const CustomAppBar(title: title),
      body: SmartTvList(
        smartTvs: smartTv, // Corrigido para smartTvs
      ),
    );
  }
}
