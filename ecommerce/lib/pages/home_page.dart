import 'package:ecommerce/widgets/todos_produtos.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/navbar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import '../widgets/categories_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            Image.asset(
              './img/category/icone/branco.png',
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Tech Place',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 25,
                shadows: [
                  const Shadow(
                    color: Color.fromARGB(255, 66, 66, 66), // Cor da sombra
                    offset: Offset(
                        2, 2), // Deslocamento da sombra (horizontal, vertical)
                    blurRadius: 3, // Raio de desfoque da sombra
                  ),
                ],
              ),
            )
          ],
        ),
        toolbarHeight: 60, // Altura da Appbar
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          ),
        ],
      ),
      drawer: const NavDrawer(),
      backgroundColor: const Color.fromARGB(255, 247, 246, 246),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                //parte de configuração do layout principal
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35)),
                      ),
                    ),
                    
                    //container com o título de categorias
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          "Categorias",
                          style: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 66, 66, 66),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),

                    //classe com layout para categoria de produtos
                    const CategoriesWidget(),
                  ],
                ),
                SizedBox(height: 15),
                //itens - titulo acima dos produtos
                Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      "Todos os Produtos",
                      style: GoogleFonts.roboto(
                        color: Color.fromARGB(255, 66, 66, 66),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ]),
            ),

            // Inclusão de todos os produtos
            const TodosProdutos(),
          ],
        ),
      ),

      //menu de botoes no footer
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
          child: GNav(
            duration:
                const Duration(milliseconds: 500), // duração da transicação
            gap: 8, // espaço entre o botão e o texto
            color: Colors.grey, // cor do ícone sem ação
            activeColor: Colors.white, // cor do texto  e botão ativados
            iconSize: 22, // tamanho dos botões
            tabBackgroundColor: Colors.purple, // cor de fundo do botão ativado
            padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10), // preenchimento da barra de navegação

            tabs: [
              GButton(
                  icon: Icons.home,
                  text: "Início",
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  }),
              GButton(
                icon: Icons.favorite,
                text: "Favoritos",
                onPressed: () {
                  Navigator.pushNamed(context, "favoritosPage");
                },
              ),
              GButton(
                  icon: Icons.shopping_cart,
                  text: "Carrinho",
                  onPressed: () {
                    Navigator.pushNamed(context, "cartPage");
                  }),
              GButton(
                  icon: Icons.person,
                  text: "Minha Conta",
                  onPressed: () {
                    Navigator.pushNamed(context, "/minhaContaPage");
                  }),
            ],
          )),
    );
  }
}
