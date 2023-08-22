import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tech Ladies', style: TextStyle(color: Colors.purple),),
        centerTitle: true,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontFamily: 'Roboto-Regular',
        ),
        iconTheme: const IconThemeData(color: Colors.grey),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          ),
        ],
      ),
      drawer: NavDrawer(),
      body: const Center(
        child: Text('Conteúdo da Página'),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
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
              child: Icon(
                Icons.account_circle,
                size: 56.0,
                color: Colors.white,
              ),
              backgroundColor: Colors.purple, // Cor de fundo do ícone de usuário
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Minha Conta'),
            onTap: () {
              // Adicione a lógica para navegar para a página inicial
              Navigator.pop(context); // Fecha o drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.abc_rounded),
            title: Text('Eletrônicos'),
            onTap: () {
              // Adicione a lógica para navegar para a página inicial
              Navigator.pop(context); // Fecha o drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.smartphone_rounded),
            title: Text('Smartphone'),
            onTap: () {
              // Adicione a lógica para navegar para a página inicial
              Navigator.pop(context); // Fecha o drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.tv_outlined),
            title: Text('SmartTv'),
            onTap: () {
              // Adicione a lógica para navegar para a página inicial
              Navigator.pop(context); // Fecha o drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: () {
              // Adicione a lógica para navegar para a página de configurações
              Navigator.pop(context); // Fecha o drawer
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
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios_new_rounded),
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
          title: Text('Eletrônicos'),
          onTap: () {
            query = 'Eletrônicos';
            showResults(context);
          },
        ),
        ListTile(
          title: Text('Smartphone'),
          onTap: () {
            query = 'Smartphone';
            showResults(context);
          },
        ),
        ListTile(
          title: Text('SmartTv'),
          onTap: () {
            query = 'SmartTv';
            showResults(context);
          },
        ),
        // Adicione mais sugestões de pesquisa conforme necessário
      ],
    );
  }
}