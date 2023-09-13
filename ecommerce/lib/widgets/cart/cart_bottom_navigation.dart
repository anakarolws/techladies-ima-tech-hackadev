import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CartBottomNavigation extends StatelessWidget {
  const CartBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: const Color.fromARGB(31, 109, 68, 166),
      mainAxisAlignment: MainAxisAlignment.center,
      gap: 15, // espaço entre o texto e o ícone
      color: Colors.grey, // cor do ícone sem ação
      activeColor: Colors.white, // cor do texto  e botão ativados
      iconSize: 30, // tamanho do botão
      tabBackgroundColor: const Color.fromRGBO(109, 68, 166, 1),
      tabMargin: const EdgeInsets.fromLTRB(0, 10, 0, 20), 
      padding: const EdgeInsets.symmetric(
          horizontal: 30, vertical: 10), // preenchimento da barra de navegação

      tabs: [
        GButton(
            icon: Icons.shopping_basket,
            text: "Comprar",
            textStyle: GoogleFonts.roboto(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            onPressed: () {
              Navigator.pushNamed(context, "/minhaContaPage");
            }),
      ],
    );
  }
}
