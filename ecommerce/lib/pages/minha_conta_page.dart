import 'package:ecommerce/pages/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people, size: MediaQuery.of(context).size.height * 0.2),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Login',
              ),
              onChanged: _controller.setLogin,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true,
              onChanged: _controller.setPass,
            ),
            const SizedBox(height: 15),
            ValueListenableBuilder<bool>(
              valueListenable: _controller.inLoader,
              builder: (_, inLoader, __) => inLoader
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        _controller.auth().then(
                          (result) {
                            if (result) {
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Falha ao realizar login'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.purple), // Cor de fundo
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white), // Cor do texto
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10), // Define o padding
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16, // Tamanho da fonte desejado
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
