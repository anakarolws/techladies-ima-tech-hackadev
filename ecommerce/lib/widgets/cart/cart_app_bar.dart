import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title = 'Carrinho';
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back, 
          size: 28, 
          color: Color.fromRGBO(109, 68, 166, 1),
          
          ), 
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(fontSize: 20, color: const Color.fromRGBO(109, 68, 166, 1)),
      ),

      actions: [
        IconButton(
          onPressed: () {
            
          }, 
          icon: const Icon(Icons.more_vert, size: 28, color: Color.fromRGBO(109, 68, 166, 1),),
        ),
      ],
    );

  }
  @override
    Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  

}
