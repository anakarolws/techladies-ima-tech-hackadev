import 'package:ecommerce/controller/produtos_controller.dart';
import 'package:ecommerce/repository/produtos_repository_impl.dart';
import 'package:flutter/material.dart';

import '../pages/alterar_produto_page.dart';

class DetalheProduto extends StatelessWidget {
  final produtosController = ProdutoController(ProdutosRepositoryImpl());

  DetalheProduto({super.key});
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Extrai os detalhes do produto dos argumentos.
    final int id = arguments['id'];
    final String title = arguments['title'];
    final String description = arguments['description'];
    final double price = arguments['price'];
    final String category = arguments['category'];

    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes do Produto',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.white),
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
              'Preço: R\$${price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(120, 50),
                  ),
                  onPressed: () {
                    print('alterar');
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => AlterarProdutoPage(produtoId: id),
                      ),
                    );
                  },
                  child: const Text('Alterar'),
                ),
                const SizedBox(
                  height: 30,
                  width: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(120, 50),
                  ),
                  onPressed: () {
                    print('excluir');
                    produtosController.deletedProduto(id);
                  },
                  child: const Text('Excluir'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
