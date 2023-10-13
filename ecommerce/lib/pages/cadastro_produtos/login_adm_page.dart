import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: LoginPageAdm(),
    ));

class LoginPageAdm extends StatefulWidget {
  const LoginPageAdm({super.key});

  @override
  _LoginPageAdmState createState() => _LoginPageAdmState();
}

class _LoginPageAdmState extends State<LoginPageAdm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Verifique o nome de usuário e senha do administrador
  bool isAdminUser(String username, String password) {
    return username == "admin" && password == "admin123";
  }

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (isAdminUser(username, password)) {
      // Navegue para a tela do administrador
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AdminScreen()));
    } else {
      // Exiba uma mensagem de erro
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro de login'),
            content: Text('Nome de usuário ou senha incorretos.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login de Administrador'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Nome de usuário'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.purple, // Define a cor de fundo do botão como roxa
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10), // Define o padding
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 16, // Tamanho da fonte desejado
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painel do Administrador'),
        backgroundColor: Colors.purple, // Define a cor da AppBar para roxa
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Bem-vindo, Administrador!'),
            SizedBox(height: 20.0), // Adiciona um espaço vertical
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/produtosPage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.purple, // Define a cor de fundo do botão como roxa
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Define o padding
                child: const Text(
                  'Cadastrar Produtos',
                  style: TextStyle(
                    fontSize: 16, // Tamanho da fonte desejado
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
