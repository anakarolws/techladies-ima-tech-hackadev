import 'package:ecommerce/widgets/footer.dart';
import 'package:ecommerce/widgets/itens_widget.dart';
import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import '../widgets/categories_widget.dart';
import '../widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Espaço Navbar'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: ListView(
            children: [
              /*Classe do menu navbar, que está na pasta de widgets, ver importação*/
              //const HomeAppBar(),

              /**Configuração de layout */
              Container(
                //height: 500,
                padding: const EdgeInsets.only(top: 15),
                decoration: const BoxDecoration(
                  //TODO: verificar paleta de cores para colocar no plano de fundo

                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),

                /**Este é o main da aplicação em relação ao layout */
                child: Column(
                  children: [
                    /*esse é o container de pesquisa de produtos, caso não seja interessante colocar em comentário
                    para que possa ser utilizado no navbar com o botão de pesquisa
                  */
                    /* Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          height: 50,
                          width: 220,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Pesquise o produto...",
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.search,
                            size: 27, color: Color.fromRGBO(109, 68, 166, 1)),
                      ],
                    ),
                  ), */

                    //container titulo categorias
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: const Text(
                        "Categorias",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(109, 68, 166, 1),
                        ),
                      ),
                    ),

                    //classe com o layout para categoria de produtos
                    const CategoriesWidget(),

                    //itens - titulo acima dos produtos
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: const Text(
                        "Melhores produtos",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(109, 68, 166, 1),

                        ),
                      ),
                      ),


                      //itens dos produtos
                    const ItensWidget(),

                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const GNav(
          duration: Duration(milliseconds: 100), // duração da transicação
          gap: 8, // espaço entre o botão e o texto
          color: Colors.grey, // cor do ícone sem ação
          activeColor: Colors.white, // cor do texto  e botão ativados
          iconSize: 24, // tamanho dos botões
          tabBackgroundColor: Colors.purple, // cor de fundo do botão ativado
          padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10), // preenchimento da barra de navegação

          tabs: [
            GButton(icon: Icons.home, text: "Início"),
            GButton(icon: Icons.favorite, text: "Favoritos"),
            GButton(icon: Icons.view_list, text: "Categorias"),
            GButton(icon: Icons.person, text: "Perfil"),
          ],
        ));
  }
}
