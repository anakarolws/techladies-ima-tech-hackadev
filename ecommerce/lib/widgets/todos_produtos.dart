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
                      color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 4, // Adicionei elevação para destacar o Card
  margin: const EdgeInsets.all(8), // Adicionei margem ao Card
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
                              fontSize: 16,
                              color: Color.fromRGBO(109, 68, 166, 1),
                              ))),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("R\$${produto.price.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 66, 66, 66))),
                            const Icon(Icons.shopping_cart_checkout,
                                color: Color.fromARGB(255, 121, 121, 121)),
                          ])),
                ])),
          );
        },
      ),
    );
  }
}

