import 'package:ecommerce/model/dados_produtos.dart';
import 'package:ecommerce/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class TodosProdutos extends StatelessWidget {
  const TodosProdutos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var produtos = todasCategorias.getTodosProdutos();
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.78),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var produto = produtos[index];
          return GestureDetector(
            onTap: () => _irDetalhesPage(context, index),
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
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(109, 68, 166, 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "-${produto.discount}%",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        //botão favoritos
                        const LikeButton(
                            animationDuration: Duration(seconds: 0))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Hero(
                      tag: 'hero-produto-$index',
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(
                          produto.image!,
                          height: 120,
                          width: 120,
                        ),
                      ),
                    ),
                  ),
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
        childCount: produtos.length,
      ),
    );
  }

  void _irDetalhesPage(BuildContext context, int index) {
    var produto = todasCategorias.getTodosProdutos()[index];

    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) => Scaffold(
          appBar: CustomAppBar(title: produto.title),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        width: double.infinity,
                        child: Hero(
                          tag: "hero-produto-$index",
                          child: Image.asset(
                            produto.image!,
                            width: 400,
                            height: 300,
                          ),
                        ),
                      ),
                      //coluna com a descrição e os dois botoes separados para alterar plano de fundo
                      Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                produto.description!,
                                style: GoogleFonts.roboto(
                                  color: const Color.fromRGBO(109, 68, 166, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              width: 900,
                              height: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        //Lógica para adicionar ao carrinho
                                        print("Adicionado ao carrinho");
                                      },
                                      //estilo do botão
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 152, 122, 194),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                      //texto do botão estilizado
                                      child: Text(
                                        'Add ao carrinho',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      )),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      //Lógica para comprar agora
                                      print('Comprar agora');
                                    },
                                    //estilo do botão
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(109, 68, 166, 1),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    child: Text('Comprar agora',
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        )),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/avaliacaoPage');
                                      //Lógica para comprar agora
                                      //print('Avaliar este produto');
                                    },
                                    //estilo do botão
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(109, 68, 166, 1),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    child: Text('Avaliar produto',
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}