import 'package:flutter/material.dart';

import '../widgets/cart/cart_app_bar.dart';
// import '../widgets/cart_bottom_navbar.dart';
import '../widgets/cart/cart_item_samples.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppBar(),
      body: CartItemSamples(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Colors.purple, // Define a cor de fundo do botão como roxa
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/minhaContaPage");
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 50, vertical: 20), // Define o padding
          child: const Text(
            'Finalizar Pedido',
            style: TextStyle(
              fontSize: 20, // Tamanho da fonte desejado
            ),
          ),
        ),
      ),
    );
  }
}
