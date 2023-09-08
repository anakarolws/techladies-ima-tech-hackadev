import 'package:ecommerce/pages/smartphone_page.dart';
import 'package:ecommerce/pages/smarttv_page.dart';
import 'package:flutter/material.dart';
import '../pages/eletronicos_page.dart';


class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 236, 204, 242),
            ),
            accountName: Text(
              'Seu Nome',
              style: TextStyle(
                color: Color.fromRGBO(109, 68, 166, 1), // Cor do nome
                fontSize: 18.0, // Tamanho do texto do nome
              ),
            ),
            accountEmail: Text(
              'seuemail@example.com',
              style: TextStyle(
                color: Color.fromRGBO(109, 68, 166, 1), // Cor do email
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Icon(
                Icons.account_circle,
                size: 56.0,
                color: Colors.white,
              ), // Cor de fundo do ícone de usuário
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Minha Conta'),
            onTap: () {
              // Adicione a lógica para navegar para a página inicial
              Navigator.pop(context); // Fecha o drawer
              Navigator.pushNamed(context, '/minhaContaPage');
              // Navigator.push(
              //  context,
              //   MaterialPageRoute(builder: (context) => const MinhaContaPage()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.abc_rounded),
            title: const Text('Eletrônicos'),
            onTap: () {
              // Adicione a lógica para navegar para a página inicial
              Navigator.pop(context); // Fecha o drawer
              Navigator.pushNamed(context, '/eletronicosPage');
            },
          ),
          ListTile(
            leading: const Icon(Icons.smartphone_rounded),
            title: const Text('Smartphones'),
            onTap: () {
              // Adicione a lógica para navegar para a página inicial
              Navigator.pop(context); // Fecha o drawer
              Navigator.pushNamed(context, '/smartphonePage');
            },
          ),
          ListTile(
            leading: const Icon(Icons.tv_outlined),
            title: const Text('SmartTvs'),
            onTap: () {
              // Adicione a lógica para navegar para a página inicial
              Navigator.pop(context); // Fecha o drawer
              Navigator.pushNamed(context, '/smartTv');
            },
          ),
          ListTile(
            leading: const Icon(Icons.highlight),
            title: const Text('Casa Inteligente'),
            onTap: () {
              // Adicione a lógica para navegar para a página inicial
              Navigator.pop(context); // Fecha o drawer
              Navigator.pushNamed(context, '/casaInteligentePage');
            },
          ),
          ListTile(
            leading: const Icon(Icons.laptop_chromebook),
            title: const Text('Informática'),
            onTap: () {
              // Adicione a lógica para navegar para a página inicial
              Navigator.pop(context); // Fecha o drawer
              Navigator.pushNamed(context, '/informaticaPage');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              // Adicione a lógica para navegar para a página de configurações
              Navigator.pop(context); // Fecha o drawer
              Navigator.pushNamed(context, '/configuracoesPage');
            },
          ),
          // Adicione mais itens de menu conforme necessário
        ],
      ),
    );
  }
}


class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Resultados para: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: const Text('Eletrônicos'),
          onTap: () {
            query = 'Eletrônicos';
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const EletronicosPage()));
          },
        ),
        ListTile(
          title: const Text('Smartphones'),
          onTap: () {
            query = 'Smartphones';
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SmartphonePage()),
            );
          },
        ),
        ListTile(
          title: const Text('SmartTvs'),
          onTap: () {
            query = 'SmartTvs';
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SmartTvPage()),
            );
          },
        ),
        // Adicione mais sugestões de pesquisa conforme necessário
      ],
    );
  }
}
