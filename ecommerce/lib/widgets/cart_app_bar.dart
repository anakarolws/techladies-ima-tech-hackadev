import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              //retorna para a tela anterior
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 28,
              color: Color.fromRGBO(109, 68, 166, 1),
            ),
          ),
        ],
      ),
    );
  }
}
