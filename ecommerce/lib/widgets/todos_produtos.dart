import 'package:ecommerce/model/botao_favoritos.dart';

import 'package:ecommerce/widgets/hero_image.dart';
import 'package:flutter/material.dart';
import '../controller/produtos_controller.dart';
import '../repository/produtos_repository_impl.dart';
import 'hero_details.dart';
import 'hero_todascategorias/hero_detailsall.dart';

class TodosProdutosCategoria extends StatefulWidget {
  const TodosProdutosCategoria({super.key});

  @override
  State<TodosProdutosCategoria> createState() => _TodosProdutosCategoriaState();
}

class _TodosProdutosCategoriaState extends State<TodosProdutosCategoria> {
  var produtoController = ProdutoController(ProdutosRepositoryImpl());
  String tagImage = 'hero-produto';

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: produtoController.fetchProdutosList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.78,
            ),
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => DetalhesPageAll(
                        categorias: snapshot.data!,
                        index: index,
                        tagValor: tagImage,
                      ),
                    ),
                  );
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4, // Adicionei elevação para destacar o Card
                    margin: const EdgeInsets.all(8), // Adicionei margem ao Card
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //botão favoritos
                            FavoritosBotao(),
                          ],
                        ),
                      ),
                      Expanded(
                          child: HeroImage(
                              tag: '$tagImage-$index',
                              image: snapshot.data![index].link)),
                      Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(snapshot.data![index].title,
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
                                Text(
                                    "R\$${snapshot.data![index].price.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 66, 66, 66))),
                                const Icon(Icons.shopping_cart_checkout,
                                    color: Color.fromARGB(255, 121, 121, 121)),
                              ])),
                    ])),
              );
            },
          );
        }
      },
    );
  }
}

class TodosProdutos extends StatelessWidget {
  const TodosProdutos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TodosProdutosCategoria();
  }
}
