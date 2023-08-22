import 'package:flutter/material.dart';

import '../widgets/cart_app_bar.dart';
import '../widgets/cart_bottom_navbar.dart';
import '../widgets/cart_item_samples.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
          const CartAppBar(),


          //container com os dados dos produtos do carrinho
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                CartItemSamples(),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(109, 68, 166, 1),
                          borderRadius: BorderRadius.circular(20),

                        ),

                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Código de cupom",
                        style: TextStyle(
                          color: Color.fromRGBO(109, 68, 166, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: CartBottomNavbar(),
    );
  }
}