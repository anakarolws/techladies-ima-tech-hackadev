import 'package:flutter/material.dart';

class Agradecimento extends StatelessWidget {
  const Agradecimento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Avaliações do produto',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Text(
          'Obrigada pela sua avaliação!',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            decoration: TextDecoration.none,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
