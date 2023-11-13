import 'package:ecommerce/controller/produtos_controller.dart';
import 'package:ecommerce/model/botao_favoritos.dart';
import 'package:ecommerce/repository/produtos_repository_impl.dart';
import 'package:ecommerce/widgets/custom_appbar.dart';
import 'package:ecommerce/widgets/priceWidget.dart';
import 'package:flutter/material.dart';

import '../widgets/hero_details.dart';
import '../widgets/hero_image.dart';

class Eletronicos extends StatefulWidget {
  const Eletronicos({super.key});

  @override
  State<Eletronicos> createState() => _EletronicosState();
}

class _EletronicosState extends State<Eletronicos> {
  final String titulo = "Eletrônicos";
  var produtoController = ProdutoController(ProdutosRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    const String tagImage = 'hero-eletronicos';

    return Scaffold(
      appBar: CustomAppBar(title: titulo),
      body: FutureBuilder(
        future: produtoController.fetchProdutosCategoria(titulo),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
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
                        builder: (context) => DetalhesPage(
                          categoria: snapshot.data![index].category,
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
                              vertical: 5, horizontal: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FavoritosBotao(),
                            ],
                          ),
                        ),
                        Expanded(
                          child: HeroImage(
                            tag: '$tagImage-$index',
                            image: snapshot.data![index].link,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            snapshot.data![index].title,
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
                                  price: snapshot.data![index].price,
                                  color: const Color.fromARGB(255, 66, 66, 66)),
                              const Icon(Icons.shopping_cart_checkout,
                                  color: Color.fromARGB(255, 121, 121, 121)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class EletronicosPage extends StatelessWidget {
  const EletronicosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Eletronicos();
  }
}
