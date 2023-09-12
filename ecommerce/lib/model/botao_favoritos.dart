import 'package:flutter/material.dart';
class FavoritosBotao extends StatefulWidget {
  @override
  _FavoritosBotaoState createState() => _FavoritosBotaoState();
}

class _FavoritosBotaoState extends State<FavoritosBotao> {
  bool isFavorito = false;

  void _mostrarSnackBar(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                isFavorito = !isFavorito;
                if (isFavorito) {
                  _mostrarSnackBar('Adicionado aos Favoritos');
                } else {
                  _mostrarSnackBar('Removido dos Favoritos');
                }
              });
            },
            icon: Icon(
              isFavorito ? Icons.favorite : Icons.favorite_border,
              color: isFavorito ? const Color.fromRGBO(109, 68, 166, 1) : null,
            ),
          ),
        ],
      ),
    );
  }
}
