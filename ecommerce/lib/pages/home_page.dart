import 'package:ecommerce/widgets/melhores_produtos.dart';
import 'package:flutter/material.dart';

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

      //DENISE E ANA KAROLINA COLOQUEM O NAVBAR NESSA PARTE 
      appBar: AppBar(
         title: const Text('Espaço Navbar'),
         centerTitle: true,
      ),
      //DENISE E ANA KAROLINA COLOQUEM O NAVBAR NESSA PARTE 
    
      body: Container(
         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),

         child: ListView(
            children: [

              //parte de configuração do layout principal
              Container(

                padding: const EdgeInsets.only(top: 15),
                decoration: const BoxDecoration(
                 
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)
                  ),
                ),
              ),

              
              //container com o título de categorias
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: const Text("Categorias",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(109, 68, 166, 1),
                  ),
                ),
              ),


            //classe com layout para categoria de produtos
            const CategoriesWidget(),
            
                  //itens - titulo acima dos produtos
                    Container(
                      alignment: Alignment.centerLeft,
                      margin:
                          const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                  MelhoresProdutos(),
            ],
         ),
      ),


      //menu de botoes no footer
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),

        child: GNav(

          duration: const Duration(milliseconds: 500), // duração da transicação
            gap: 8, // espaço entre o botão e o texto
            color: Colors.grey, // cor do ícone sem ação
            activeColor: Colors.white, // cor do texto  e botão ativados
            iconSize: 24, // tamanho dos botões
            tabBackgroundColor: Colors.purple, // cor de fundo do botão ativado
            padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10), // preenchimento da barra de navegação

            tabs: [
               const GButton(icon: Icons.home, text: "Início"),
               const GButton(icon: Icons.favorite, text: "Favoritos"),
                GButton(
                  icon: Icons.shopping_cart,
                  text: "Carrinho",
                  onPressed: () {
                    Navigator.pushNamed(context, "cartPage");
                  }),
               const GButton(icon: Icons.person, text: "Perfil"),
            ],
          
        )
        ),

        

    );
  }
}
