import 'package:flutter/material.dart';

/*
Class criada para apresentar acima do grid de produtos, uma seleção por categoria
 */
class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
      List<String> nomesCategorias = [
      "Eletrônicos",
      "Smartphones",
      "Smart TV"
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //esse for gera as demais imagens, o container abaixo é sobre a relação de categorias
          for (int i = 1; i < 4; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
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
        ],
      ),
    );
  }
}
