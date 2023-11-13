// ignore_for_file: duplicate_import, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:ecommerce/widgets/priceWidget.dart';
import 'package:ecommerce/widgets/price_installment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controller/produtos_controller.dart';
import '../repository/produtos_repository_impl.dart';
import 'custom_appbar.dart';

class DetalhesPage extends StatelessWidget {
  final dynamic categoria;
  final int index;
  final String tagValor;

  DetalhesPage(
      {required this.categoria, required this.index, required this.tagValor});

  @override
  Widget build(BuildContext context) {
    var produtoController = ProdutoController(ProdutosRepositoryImpl());
    
   
    return Scaffold(
      appBar: CustomAppBar(title: categoria),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: produtoController.fetchProdutosCategoria(categoria),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Erro: ${snapshot.error}'),
              );
            } else {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Container com título do produto
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data![index].title,
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 66, 66, 66),
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Centraliza horizontalmente
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 15,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) {
                              return Icon(
                                Icons.star,
                                color: Colors
                                    .yellow, // Defina a cor desejada aqui
                              );
                            },
                            glowColor: Color.fromRGBO(109, 68, 166, 1),
                            onRatingUpdate: (index) {},
                          )
                        ],
                      ),
                    ),

                    // Container com a imagem do produto
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Hero(
                        tag: "$tagValor-$index",
                        child: Image.network(
                          snapshot.data![index].link,
                          // width: 400,
                          height: 200,
                        ),
                      ),
                    ),

                    // Container com o valor do produto
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Centraliza horizontalmente
                        children: [
                          PriceWidget(
                            price: snapshot.data![index].price,
                            color: Color.fromARGB(255, 66, 66, 66),
                            fontSize: 24,
                          ),
                          SizedBox(height: 8), // Espaçamento
                          Text(
                            'À vista com 10% de desconto: R\$ ${(snapshot.data![index].price * 0.9).toStringAsFixed(2)}',
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              color: Color.fromRGBO(109, 68, 166, 1),
                            ),
                          ),
                          SizedBox(height: 5), // Espaçamento
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: PriceInstallmentWidget(
                                price: snapshot.data![index].price,
                                fontSize: 15,
                                color: Color.fromRGBO(109, 68, 166, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Container com o título e a descrição do produto
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Descrição:',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 66, 66, 66),
                            ),
                          ),
                          SizedBox(
                              height:
                                  8), // Espaçamento entre o título e a descrição
                          Text(
                            snapshot.data![index].description,
                            style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Container Produtos relacionados texto
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Text('Produtos Relacionados',
                            style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 66, 66, 66),
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ))),

                    // Container com a ListView horizontal
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.network(
                                  snapshot.data![index].link,
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
                  ]);
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
            iconSize: 16, // tamanho dos botões
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
