import 'package:ecommerce/model/dados_produtos.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../widgets/custom_appbar.dart';

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
    return Scaffold(
      appBar: CustomAppBar(title: title),
      
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.78),
        itemCount: eletronicos.length,
        itemBuilder: (context, index) {
          return Card(
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
                          "-${eletronicos[index].discount}%",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //botão favoritos
                      const LikeButton(animationDuration: Duration(seconds: 0))
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      eletronicos[index].image!,
                      height: 120,
                      width: 140,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(eletronicos[index].title!,
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
                          Text("R\$${eletronicos[index].price}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(109, 68, 166, 1))),
                          const Icon(Icons.shopping_cart_checkout,
                              color: Color.fromRGBO(109, 68, 166, 1)),
                        ])),
              ]));
        },
      ),
    );
  }
}
