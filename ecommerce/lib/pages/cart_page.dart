import 'package:ecommerce/widgets/cart/cart_bottom_navigation.dart';
import 'package:flutter/material.dart';


import '../widgets/cart/cart_app_bar.dart';
// import '../widgets/cart_bottom_navbar.dart';
import '../widgets/cart/cart_item_samples.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CartAppBar(),
        body: CartItemSamples(),
        bottomNavigationBar: CartBottomNavigation()
    
    );
  }
}
