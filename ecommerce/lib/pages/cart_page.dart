import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../widgets/cart_app_bar.dart';
// import '../widgets/cart_bottom_navbar.dart';
import '../widgets/cart_item_samples.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            const CartAppBar(),

            //container com os dados dos produtos do carrinho
            Container(
              height: 700,
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  CartItemSamples(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(109, 68, 166, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Código de cupom",
                            style: TextStyle(
                              color: Color.fromRGBO(109, 68, 166, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar:
          GNav(
          mainAxisAlignment: MainAxisAlignment.center,
            gap: 10, // espaço entre o texto e o ícone
            color: Colors.grey, // cor do ícone sem ação
            activeColor: Colors.white, // cor do texto  e botão ativados
            iconSize: 30, // tamanho do botão
            tabBackgroundColor: Colors.purple,
            tabMargin: EdgeInsets.symmetric(vertical: 20, horizontal: 0), // cor de fundo do botão ativado
            padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 20), // preenchimento da barra de navegação

            tabs: [
              GButton(icon: Icons.shopping_basket, text: "Comprar", onPressed: () {
                    Navigator.pushNamed(context, "/minhaContaPage");
                  }),
              
            ],
          ));
  }
}
