import 'package:ecommerce/pages/casa_inteligente_page.dart';
import 'package:ecommerce/pages/eletronicos_page.dart';
import 'package:ecommerce/pages/informatica_page.dart';
import 'package:ecommerce/pages/smarttv_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/smartphone_page.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  final String eletronico = "Eletrônicos";
  final String smartphone = "Smartphones";
  final String smartTv = "Smart TV";
  final String casaInteligente = "Casa Inteligente";
  final String informatica = "Informática";

  void navigateToCategoryPage(BuildContext context, String category) {
    Map<String, Widget Function()> categoryPages = {
      eletronico: () => const EletronicosPage(),
      smartphone: () => const SmartphonePage(),
      smartTv: () => const SmartTvPage(),
      casaInteligente: () => const CasaInteligentePage(),
      informatica: () => const InformaticaPage()
    };

    if (categoryPages.containsKey(category)) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => categoryPages[category]!(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    //Separar lógica de construção de cartão de categoria para função _buildCategoryCard
    final categoriesName = [
      eletronico,
      smartphone,
      smartTv,
      casaInteligente,
      informatica
    ];

    //mesmo usando ListView ocorreu estouro de altura, onde o recomendado foi encapsular em um Container ou SizedBox para incluir uma altura
    return SizedBox(
      height: 100,
      //alterado para ListView devido a estouro de largura
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesName.length,
        itemBuilder: (context, index) {
          //listar nomesCategorias para apresentar em tela
          return _buildCategoryCard(context, categoriesName[index], index + 1);
        },
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String category, int i) {
    return InkWell(
      onTap: () => navigateToCategoryPage(context, category),
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),

        decoration: BoxDecoration(
          color: const Color.fromRGBO(156, 131, 192, 0.10),
          borderRadius: BorderRadius.circular(20),
        ),

        //container de cada categoria
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/category/listCategories/$i.webp",
              width: 100,
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                category,
                style: GoogleFonts.roboto(
                    color: const Color.fromRGBO(109, 68, 166, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.bold), //google
              ),
            ),
          ],
        ),
      ),
    );
  }
}
