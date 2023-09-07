import 'package:ecommerce/model/dados_produtos.dart';
import 'package:ecommerce/model/eletronicos.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/hero_details.dart';
import '../widgets/hero_image.dart';

class EletronicosPrice extends StatefulWidget {
  const EletronicosPrice({super.key});

  @override
  State<EletronicosPrice> createState() => _EletronicosPriceState();
}

class _EletronicosPriceState extends State<EletronicosPrice> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class EletronicosPage extends StatelessWidget {
  const EletronicosPage({super.key});
  final String title = "Eletrônicos";

  @override
  Widget build(BuildContext context) {
    const String tagImage = 'hero-eletronicos';

    DetalhesPage detalhesPage = DetalhesPage();

    return Scaffold(
        appBar: CustomAppBar(title: title),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.78),
            itemCount: eletronicos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => detalhesPage.detalhesCategoria(
                      context, eletronicos, index, tagImage),
                  child: Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color.fromRGBO(109, 68, 166, 1), width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(109, 68, 166, 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "-${eletronicos[index].discount}%",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              //botão favoritos
                              const LikeButton(
                                  animationDuration: Duration(seconds: 0))
                            ],
                          ),
                        ),
                        Expanded(
                          child: HeroImage(
                              tag: '$tagImage-$index',
                              image: eletronicos[index].image!),
                        ),
                        Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(eletronicos[index].title!,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(109, 68, 166, 1),
                                    fontWeight: FontWeight.bold))),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("R\$${eletronicos[index].price}",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(109, 68, 166, 1))), const Text('Opções de Pagamento'),
                                  IconButton(
                                    icon: Icon(Icons.credit_card),
                                    onPressed: () {
                                      // Exibe o modal com as informações do pagamento
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            final Eletronicos =
                                                eletronicos[index];
                                            final priceWithDiscount =
                                                Eletronicos.price! * 0.9;
                                            return Column (children: [
                                              ListTile(
                                                title: Text(
                                                    'Preço à vista com desconto:'),
                                                subtitle: Text(
                                                    'R\$ ${priceWithDiscount.toStringAsFixed(2)}'),
                                              ),
                                              ListTile(
                                                  title: Text(
                                                      'Opções de Parcelamento:'),
                                                  subtitle: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        for (int i = 1;
                                                            i <= 6;
                                                            i++)
                                                          ListTile(
                                                            title: Text(
                                                                '$i x ${calculateParcelValue(priceWithDiscount, i).toStringAsFixed(2)}'),
                                                          )
                                                      ]))
                                            ]);
                                          });
                                    },
                                  )
                                ]))
                      ])));
            }));
  }

  double calculateParcelValue(double price, int numberOfInstallments) {
    final interestRate = 0.02; // 2% de juros
    final totalValue = price * (1 + interestRate);
    return totalValue / numberOfInstallments;
  }
}

