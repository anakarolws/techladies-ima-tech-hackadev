import 'package:ecommerce/pages/configuracoes_page.dart';
import 'package:ecommerce/pages/eletronicos_page.dart';
import 'package:ecommerce/pages/minha_conta_page.dart';
import 'package:ecommerce/pages/smartphone_page.dart';
import 'package:ecommerce/pages/smarttv.dart';
import 'package:flutter/material.dart';


import 'pages/cart_page.dart';
import 'pages/home_page.dart';
// ignore: duplicate_import
import 'pages/minha_conta_page.dart';
// ignore: unused_import
import 'pages/favoritos.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Ladies',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        "/": (context) => const HomePage(),
        "cartPage":(context) => const CartPage(),
        "/minhaContaPage": (context) => const MinhaContaPage(),
        "/eletronicosPage": (context) => EletronicosPage(),
        "/smartphonePage": (context) => SmartphonePage(),
        "/smartTv": (context) => SmartTv(),
        "/configuracoesPage": (context) => const ConfiguracoesPage(),
        "favoritosPage": (context) => const Favoritos(),
        
        
      },
    );
  }
}


