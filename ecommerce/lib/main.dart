import 'package:ecommerce/pages/agradecimento_page.dart';
import 'package:ecommerce/pages/alterar_produto_page.dart';
import 'package:ecommerce/pages/avaliacao_page.dart';
import 'package:ecommerce/pages/cadastro_produtos/login_adm_page.dart';
import 'package:ecommerce/pages/cadastro_produtos/produtos_page.dart';
import 'package:ecommerce/pages/casa_inteligente_page.dart';
import 'package:ecommerce/pages/configuracoes_page.dart';
import 'package:ecommerce/pages/eletronicos_page.dart';
import 'package:ecommerce/pages/informatica_page.dart';
import 'package:ecommerce/pages/minha_conta_page.dart';
import 'package:ecommerce/pages/smartphone_page.dart';
import 'package:ecommerce/pages/smarttv_page.dart';
import 'package:ecommerce/pages/splash_page.dart';
import 'package:ecommerce/widgets/detalheproduto.dart';
import 'package:flutter/material.dart';

import 'pages/cart_page.dart';
import 'pages/home_page.dart';
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
        "cartPage": (context) => const CartPage(),
        "/minhaContaPage": (context) => LoginPage(),
        "/eletronicosPage": (context) => const EletronicosPage(),
        "/smartphonePage": (context) => const SmartphonePage(),
        "/smartTv": (context) => const SmartTvPage(),
        "/configuracoesPage": (context) => const ConfiguracoesPage(),
        "favoritosPage": (context) => const Favoritos(),
        "/avaliacaoPage": (context) => const ProductReviewScreen(),
        "/agradecimentoPage": (context) => const Agradecimento(),
        '/splash': (_) => const SplashPage(),
        "/casaInteligentePage": (context) => const CasaInteligentePage(),
        "/informaticaPage": (context) => const InformaticaPage(),
        "/produtosPage": (context) => const ProdutosPage(),
        "/loginPageAdm": (context) => const LoginPageAdm(),
        "/detalheproduto": (context) => DetalheProduto(),
        "/alterarProdutoPage": (context) => const AlterarProdutoPage(produtoId: null),

      },
    );
  }
}
