import 'package:flutter/material.dart';

class DetalheProduto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Extrai os detalhes do produto dos argumentos.
    final String title = arguments['title'];
    final String description = arguments['description'];
    final double price = arguments['price'];
    final String category = arguments['category'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Categoria: $category',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Descrição:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Preço: \$${price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}