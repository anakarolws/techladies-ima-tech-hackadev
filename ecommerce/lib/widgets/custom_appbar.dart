import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromRGBO(109, 68, 166, 1),),
        title: Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 20, 
            fontWeight: FontWeight.bold, 
            color: const Color.fromRGBO(109, 68, 166, 1),
          ),

        ),
      );
  }

  @override
 
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
