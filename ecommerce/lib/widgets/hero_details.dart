import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_appbar.dart';

class DetalhesPage {
  detalhesCategoria(BuildContext context, dynamic categoria, int index, String tagValor) {
    var produto = categoria[index];
    Navigator.of(context).push(
      MaterialPageRoute<void>(
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
                            tag: "$tagValor-$index",
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
                                    color:
                                        const Color.fromRGBO(109, 68, 166, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 900,
                                height: 80,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          //Lógica para Comprar Agora
                                          print("Comprar agora");
                                        },
                                        //estilo do botão
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 152, 122, 194),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                        //texto do botão estilizado
                                        child: Text(
                                          'Comprar agora',
                                          style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        )),
                                    const SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        //Lógica para add ao carrinho
                                        print('Add ao carrinho');
                                      },
                                      //estilo do botão
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            109, 68, 166, 1),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 10),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),

                                      child: const Row(
                                        children: [
                                          Icon(Icons.shopping_cart, 
                                          color: Colors.white,
                                          size: 13,)
                                        ],
                                      )
                                    ),
                                    const SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/avaliacaoPage');
                                        //Lógica para comprar agora
                                        //print('Avaliar este produto');
                                      },
                                      //estilo do botão
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            109, 68, 166, 1),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                      child: Text('Avaliar produto',
                                          style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 13,
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
      ),
    );
  }
}
