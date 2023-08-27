import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_nav_bar/google_nav_bar.dart';


class MinhaConta extends StatefulWidget {
   const MinhaConta ({super.key});
  @override
   _Minhaconta createState() => _Minhaconta(); 
  }


class _Minhaconta extends State<MinhaConta> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Minha Conta", style: TextStyle(color: Colors.purple),), //criação da barra, texto e cor.
      centerTitle: true, 
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.grey), //botão
      )
       );
    
  }
  
}
