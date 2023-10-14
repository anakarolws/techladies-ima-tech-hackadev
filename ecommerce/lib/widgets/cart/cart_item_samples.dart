import 'package:flutter/material.dart';

class CartItemSamples extends StatelessWidget {
  const CartItemSamples({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          for (int i = 1; i < 4; i++)
            Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  //container da imagem do carrinho
                  Expanded(
                    child: Container(
                      height: 90,
                      width: 90,
                      margin: const EdgeInsets.only(right: 15),
                      child: Image.asset(
                          "assets/img/category/eletroeletronicos/0$i.webp"),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Nome do Produto",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.purple,
                          ),
                        ),
                        Text(
                          "R\$55.99",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 66, 66, 66),
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 18, // Defina o tamanho do ícone
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    )
                                  ]),
                              child: const Icon(
                                Icons.add,
                                size: 18,
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: const Text(
                                "01",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(109, 68, 166, 1),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    )
                                  ]),
                              child: const Icon(
                                Icons.remove,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    ]);
  }
}
