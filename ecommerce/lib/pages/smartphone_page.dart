import 'package:ecommerce/model/botao_favoritos.dart';
import 'package:ecommerce/model/dados_produtos.dart';
import 'package:ecommerce/widgets/custom_appbar.dart';
import 'package:ecommerce/widgets/priceWidget.dart';
import 'package:flutter/material.dart';

import '../widgets/hero_details.dart';
import '../widgets/hero_image.dart';

class SmartPhonePrice extends StatefulWidget {
  const SmartPhonePrice({super.key});

  @override
  State<SmartPhonePrice> createState() => _SmartPhonePriceState();
}

class _SmartPhonePriceState extends State<SmartPhonePrice> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SmartphonePage extends StatelessWidget {
  const SmartphonePage({Key? key});
  final String title = "Smartphones";

  @override
  Widget build(BuildContext context) {
    const String tagImage = 'hero-smartphone';

    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.78,
        ),
        itemCount: smartphones.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => DetalhesPage(
                    categoria: smartphones,
                    index: index,
                    tagValor: tagImage,
                  ),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4, // Adicionei elevação para destacar o Card
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 7,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /* Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(109, 68, 166, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "-${smartphones[index].discount}%",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ), */
                        // Botão favoritos
                        FavoritosBotao(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: HeroImage(
                      tag: '$tagImage-$index',
                      image: smartphones[index].image!,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      smartphones[index].title!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(109, 68, 166, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PriceWidget(
                            price: smartphones[index].price,
                            color: Color.fromARGB(255, 66, 66, 66)),
                        const Icon(
                          Icons.shopping_cart_checkout,
                          color: Color.fromARGB(255, 121, 121, 121),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
