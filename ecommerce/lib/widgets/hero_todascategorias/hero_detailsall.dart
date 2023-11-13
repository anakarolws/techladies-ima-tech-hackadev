import 'package:ecommerce/controller/produtos_controller.dart';
import 'package:ecommerce/model/eletronicos.dart';
import 'package:ecommerce/model/informatica.dart';
import 'package:ecommerce/model/smart_phone.dart';
import 'package:ecommerce/model/smart_tv.dart';
import 'package:ecommerce/model/casa_inteligente.dart';
import 'package:ecommerce/repository/produtos_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../model/dados_produtos.dart';
import '../custom_appbar.dart';
import '../priceWidget.dart';
import '../price_installment_widget.dart';

class DetalhesPageAll extends StatelessWidget {
  final List<dynamic> categorias;
  final int index;
  final String tagValor;

  DetalhesPageAll(
      {required this.categorias, required this.index, required this.tagValor});

  @override
  Widget build(BuildContext context) {
    var produto = categorias[index];
    var produtoController = ProdutoController(ProdutosRepositoryImpl());

    return Scaffold(
      appBar: CustomAppBar(title: produto.toString()),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: produtoController.fetchProdutosList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //titulo produto
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        snapshot.data![index].title,
                        style: GoogleFonts.roboto(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 66, 66, 66),
                        ),
                      ),
                    ),
                  ),

                  //stars
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 15,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4),
                          itemBuilder: (context, _) {
                            return const Icon(
                              Icons.star,
                              color:
                                  Colors.yellow, // Defina a cor desejada aqui
                            );
                          },
                          glowColor: const Color.fromRGBO(109, 68, 166, 1),
                          onRatingUpdate: (index) {},
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //Container com a imagem do produto
                  SizedBox(
                    width: double.infinity,
                    child: Hero(
                      tag: "$tagValor-$index",
                      child: Image.network(
                        snapshot.data![index].link,
                        width: 400,
                        height: 200,
                      ),
                    ),
                  ),

                  //Container com o valor do produto
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PriceWidget(
                          price: snapshot.data![index].price,
                          color: const Color.fromRGBO(255, 66, 66, 1),
                          fontSize: 24,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'À vista com 10% de desconto: R\$ ${(snapshot.data![index].price * 0.9).toStringAsFixed(2)}',
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: const Color.fromRGBO(109, 68, 166, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: PriceInstallmentWidget(
                              price: snapshot.data![index].price,
                              fontSize: 15,
                              color: const Color.fromRGBO(109, 68, 166, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  //Container com o título e a descrição do produto
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Descrição',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 66, 66, 66),
                          ),
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        Text(
                          snapshot.data![index].description,
                          style: GoogleFonts.roboto(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),

                        //Container produtos relacionados
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Text(
                            'Produtos relacionados',
                            style: GoogleFonts.roboto(
                                color: const Color.fromARGB(255, 66, 66, 66),
                                fontSize: 21,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        //Container com Listview horizontal dos produtos
                        const SizedBox(
                          height: 10,
                        ),

                        Container(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data?[index].category.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.network(snapshot.data![index].link,
                                      width: 100,
                                      height: 100,
                                    ),
                                    Text(snapshot.data![index].title),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
      // Footer com os botões
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
        child: GNav(
            duration:
                const Duration(milliseconds: 500), // duração da transicação
            gap: 8, // espaço entre o botão e o texto
            color: Colors.grey, // cor do ícone sem ação
            activeColor: Colors.white, // cor do texto  e botão ativados
            iconSize: 15, // tamanho dos botões
            tabBackgroundColor: Colors.purple, // cor de fundo do botão ativado
            padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10), // preenchimento da barra de navegação

            tabs: [
              GButton(
                  icon: Icons.comment,
                  text: "Avaliar Produto",
                  onPressed: () {
                    Navigator.pushNamed(context, "/avaliacaoPage");
                  }),
              GButton(
                icon: Icons.shopping_cart,
                text: "Adicionar ao Carrinho",
                onPressed: () {
                  Navigator.pushNamed(context, "");
                },
              ),
              GButton(
                  icon: Icons.shopping_basket,
                  text: "Comprar",
                  onPressed: () {
                    Navigator.pushNamed(context, "/minhaContaPage");
                  }),
            ]),
      ),
    );
  }

}
