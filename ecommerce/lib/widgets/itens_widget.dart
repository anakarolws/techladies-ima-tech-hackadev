import 'package:flutter/material.dart';

class ItensWidget extends StatelessWidget {
  const ItensWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 5; i++)
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                //linha da porcentagem de desconto e do botão de curtir
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(109, 68, 166, 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "-30%",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ],
                ),

                //imagem do produto inclusa em container card
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/img/category/eletroeletronicos/fone0${i}.webp",
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ),
                ),

                //titulo do produto em card
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      "Produto:",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(109, 68, 166, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    )),

                //descrição do produto de card
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text("Descrição do produto",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(109, 68, 166, 1))),
                ),

                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "R\$60,00",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(109, 68, 166, 1)),
                          ),
                          Icon(
                            Icons.shopping_cart_checkout,
                            color: Color.fromRGBO(109, 68, 166, 1),
                          ),
                        ])),
              ],
            ),
          ),
      ],
    );
  }
}
