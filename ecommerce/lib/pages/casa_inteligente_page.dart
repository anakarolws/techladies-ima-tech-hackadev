import 'package:ecommerce/model/dados_produtos.dart';
import 'package:ecommerce/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';


class CasaInteligentePrice extends StatefulWidget {
  const CasaInteligentePrice({super.key});

  @override
  State<CasaInteligentePrice> createState() => _CasaInteligentePriceState();
}

class _CasaInteligentePriceState extends State<CasaInteligentePrice> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



class CasaInteligentePage extends StatelessWidget {
  const CasaInteligentePage({super.key});
  final String titulo = "Casa Inteligente";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: titulo),
      
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.78),
        itemCount: casaInteligente.length,
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
                          "-${casaInteligente[index].discount}%",
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
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      casaInteligente[index].image!,
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(casaInteligente[index].title!,
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
                          Text("R\$${casaInteligente[index].price}",
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
