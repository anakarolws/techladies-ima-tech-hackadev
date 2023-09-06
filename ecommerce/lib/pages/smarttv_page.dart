import 'package:ecommerce/model/dados_produtos.dart';
import 'package:ecommerce/widgets/custom_appbar.dart';
import 'package:ecommerce/widgets/hero_details.dart';
import 'package:ecommerce/widgets/hero_image.dart';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class SmartTvPrice extends StatefulWidget {
  const SmartTvPrice({super.key});

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

    DetalhesPage detalhesPage = DetalhesPage();

    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.78),
        itemCount: smartTv.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => detalhesPage.detalhesCategoria(
                context, smartTv, index, tagImage),
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Color.fromRGBO(109, 68, 166, 1), width: 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(109, 68, 166, 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "-${smartTv[index].discount}%",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const LikeButton(animationDuration: Duration(seconds: 0))
                    ],
                  ),
                ),
                Expanded(
                  child: HeroImage(
                      tag: '$tagImage-$index', image: smartTv[index].image!),
                ),
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(smartTv[index].title!,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(109, 68, 166, 1),
                            fontWeight: FontWeight.bold))),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("R\$${smartTv[index].price}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(109, 68, 166, 1))),
                          const Icon(Icons.shopping_cart_checkout,
                              color: Color.fromRGBO(109, 68, 166, 1)),
                        ])),
              ]),
            ),
          );
        },
      ),
    );
  }
}
