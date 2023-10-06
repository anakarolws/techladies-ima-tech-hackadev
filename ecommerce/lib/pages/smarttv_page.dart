import 'package:ecommerce/model/botao_favoritos.dart';
import 'package:ecommerce/model/dados_produtos.dart';
import 'package:ecommerce/widgets/custom_appbar.dart';
import 'package:ecommerce/widgets/hero_details.dart';
import 'package:ecommerce/widgets/hero_image.dart';
import 'package:ecommerce/widgets/priceWidget.dart';

import 'package:flutter/material.dart';

class SmartTvPrice extends StatefulWidget {
  const SmartTvPrice({Key? key});

  @override
  State<SmartTvPrice> createState() => _SmartTvPriceState();
}

class _SmartTvPriceState extends State<SmartTvPrice> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SmartTvPage extends StatelessWidget {
  const SmartTvPage({super.key});
  final String title = "Smart TVs";

  @override
  Widget build(BuildContext context) {
    const String tagImage = 'hero-smarttv';

    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.78,
        ),
        itemCount: smartTv.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => DetalhesPage(
                    categoria: smartTv,
                    index: index,
                    tagValor: tagImage,
                  ),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.transparent, width: 0,
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
                            "-${smartTv[index].discount}%",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ), */
                        //Botão Favoritos
                        FavoritosBotao(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: HeroImage(
                      tag: '$tagImage-$index',
                      image: smartTv[index].image!,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      smartTv[index].title!,
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
                            price: smartTv[index].price,
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
