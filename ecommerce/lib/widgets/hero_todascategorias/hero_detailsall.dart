import 'package:ecommerce/model/eletronicos.dart';
import 'package:ecommerce/model/informatica.dart';
import 'package:ecommerce/model/smart_phone.dart';
import 'package:ecommerce/model/smart_tv.dart';
import 'package:ecommerce/model/casa_inteligente.dart';
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

    return Scaffold(
      appBar: CustomAppBar(title: produto.toString()),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          // Container com a imagem do produto
          // ignore: sized_box_for_whitespace
          Container(
            width: double.infinity,
            child: Hero(
              tag: "$tagValor-$index",
              child: Image.asset(
                produto.image!,
                width: 400,
                height: 300,
              ),
            ),
          ),

          // Container com título do produto
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              produto.title,
              style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(109, 68, 166, 1)),
            ),
          ),

          // Container com opções de parcelamento
          Container(
            padding: const EdgeInsets.all(8.0),
            child: PriceInstallmentWidget(
                price: produto.price,
                fontSize: 18,
                color: const Color.fromARGB(255, 0, 0, 0)),
          ),

          // Container com o valor do produto
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceWidget(
                  price: produto.price,
                  color: const Color.fromRGBO(109, 68, 166, 1),
                  fontSize: 18,
                ),
                Text(
                  'À vista com 10% de desconto: R\$ ${(produto.price * 0.9).toStringAsFixed(2)}',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: const Color.fromRGBO(109, 68, 166, 1),
                  ),
                ),
              ],
            ),
          ),

          // Container com a descrição do produto
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              produto.description!,
              style: GoogleFonts.roboto(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBar.builder(
                initialRating: 4,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 15,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, _) {
                  return const Icon(
                    Icons.star,
                    color: Colors.yellow, // Defina a cor desejada aqui
                  );
                },
                glowColor: const Color.fromRGBO(109, 68, 166, 1),
                onRatingUpdate: (index) {},
              )
            ],
          )),

          //Container Produtos relacionados texto
          Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text('Produtos Relacionados',
                  style: GoogleFonts.roboto(
                    color: const Color.fromRGBO(109, 68, 166, 1),
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ))),

          // Container com a ListView horizontal
          // ignore: sized_box_for_whitespace

          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: validaCategoria(produto).length,
              itemBuilder: (context, i) {
                 return Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        validaCategoria(produto)[i].image!,
                        width: 100,
                        height: 100,
                      ),
                      Text(validaCategoria(produto)[i].title),
                    ],
                  ),
    );
              },
            ),
          ),
        ]),
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

  dynamic validaCategoria(dynamic produto) {
    var categoria;
    if (produto is Eletronicos) {
      categoria = eletronicos;
    } else if (produto is SmartPhone) {
      categoria = smartphones;
    } else if (produto is SmartTv) {
      categoria = smartTv;
    } else if (produto is CasaInteligente) {
      categoria = casaInteligente;
    } else if (produto is Informatica) {
      categoria = informatica;
    }

    return categoria;
  }
}
