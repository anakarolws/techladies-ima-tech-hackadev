import 'package:ecommerce/model/botao_favoritos.dart';

import 'package:ecommerce/model/dados_produtos.dart';

import 'package:ecommerce/widgets/hero_image.dart';


import 'package:flutter/material.dart';

import 'hero_todascategorias/hero_detailsall.dart';


class TodosProdutos extends StatelessWidget {
  const TodosProdutos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var produtos = todasCategorias.getTodosProdutos();
    String tag = 'hero-produto';

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.78),
      delegate: SliverChildBuilderDelegate(
        childCount: produtos.length,
        (context, index) {
          var produto = produtos[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => DetalhesPageAll(
                    categorias: produtos,
                    index: index,
                    tagValor: tag,
                  ),
                ),
              );
            },
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
                        //botão favoritos
                        FavoritosBotao(),
                      ],
                    ),
                  ),
                  Expanded(
                      child:
                          HeroImage(tag: '$tag-$index', image: produto.image!)),
                  Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(produto.title!,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(109, 68, 166, 1),
                              fontWeight: FontWeight.bold))),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("R\$${produto.price}",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(109, 68, 166, 1))),
                            const Icon(Icons.shopping_cart_checkout,
                                color: Color.fromRGBO(109, 68, 166, 1)),
                          ])),
                ])),
          );
        },
      ),
    );
  }
}

