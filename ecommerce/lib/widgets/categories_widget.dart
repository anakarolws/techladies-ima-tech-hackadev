import 'package:ecommerce/pages/eletronicos_page.dart';
import 'package:ecommerce/pages/smarttv.dart';
import 'package:flutter/material.dart';

import '../pages/smartphone_page.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  void navigateToCategoryPage(BuildContext context, String category) {
    if (category == "Eletrônicos") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EletronicosPage()),
      );
    } else if (category == "Smartphones") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SmartphonePage()),
      );
    } else if (category == "Smart TV") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SmartTv()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> nomesCategorias = ["Eletrônicos", "Smartphones", "Smart TV"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //esse for gera as demais imagens, o container abaixo é sobre a relação de categorias
          for (int i = 1; i < 4; i++)
            Material(
              child: InkWell(
                onTap: () {
                  navigateToCategoryPage(context, nomesCategorias[i-1]);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(156, 131, 192, 0.10),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //usar variavel i do for para mudar as imagens
                      Image.asset(
                        "assets/img/category/listCategories/$i.webp",
                        width: 100,
                        height: 50,
                      ),

                      //TODO: Verificar com o grupo se mantem o nome ou não, pois o tamanho vai destoar dos demais
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          nomesCategorias[i - 1],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color.fromRGBO(109, 68, 166, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

