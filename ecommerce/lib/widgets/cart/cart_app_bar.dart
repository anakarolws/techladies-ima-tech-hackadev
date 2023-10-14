import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title = 'Meu Carrinho';
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 28,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
