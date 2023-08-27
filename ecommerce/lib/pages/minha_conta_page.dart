import 'package:flutter/material.dart';

class MinhaContaPage extends StatelessWidget {
  const MinhaContaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Conta', style: TextStyle(color: Colors.purple),),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      body: const Center(
        child: Text(
          'Resultados para: Minha Conta',
          style: TextStyle(
            color: Colors.grey,
            decoration: TextDecoration.none,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
