import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              //retorna para a tela anterior
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 28,
              color: Color.fromRGBO(109, 68, 166, 1),
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 20),
            child: Text(
              "Carrinho",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(109, 68, 166, 1),
              ),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.more_vert,
            size: 30,
            color: Color.fromRGBO(109, 68, 166, 1),
          ),
        ],
      ),
    );
  }
}
