import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Footer extends StatefulWidget{
  const Footer({Key? key}) : super(key: key);
  
  @override
  State<Footer> createState() => _FooterState();
   
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context){
    return const Scaffold(
  bottomNavigationBar: GNav(
    duration: Duration(milliseconds: 100), // duração da transicação
  gap: 8, // espaço entre o botão e o texto
  color: Colors.grey, // cor do ícone sem ação
  activeColor: Colors.white, // cor do texto  e botão ativados
  iconSize: 24, // tamanho dos botões
  tabBackgroundColor: Colors.purple, // cor de fundo do botão ativado
  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // preenchimento da barra de navegação
  
        
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Início" ),
          GButton(
            icon: Icons.favorite,
            text: "Favoritos"),
          GButton(
            icon: Icons.view_list,
            text: "Categorias"),
          GButton(
            icon: Icons.person,
            text: "Perfil"),
        
      ],)

    );
  }
}
