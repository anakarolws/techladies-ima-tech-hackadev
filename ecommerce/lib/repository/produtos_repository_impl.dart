import 'package:ecommerce/model/produtos/produtos.dart';

import 'produtos_repository.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ProdutosRepositoryImpl implements ProdutosRepository {
  String dataUrl = "http://localhost:8000/api/products/";

  @override
  Future<List<Produtos>> getProdutos() async {
    List<Produtos> produtosList = [];
    var url = Uri.parse(dataUrl);
    var response = await http.get(url);
    //print('status code: ${response.statusCode}');
    var body = json.decode(response.body);

    for (var produto in body) {
      produto ['price'] = double.parse(produto['price'].toString());
      //produto ['profile'] = 'https://picsum.photos/250?image=9';
      produtosList.add(Produtos.fromJson(produto));
    }

    return produtosList;
  }

  @override
  Future<String> getProdutosById(Produtos id) {
    // TODO: implement getProdutosById
    throw UnimplementedError();
  }

  @override
  Future<void> postProdutos(
      String title, String description, double price, String category) async {
    await http.post(
      Uri.parse(dataUrl),
      headers: <String, String>{'Content-type':'application/json'},
      body: jsonEncode(<String, dynamic>{'title':title, 'description':description, 'price': price, 'category':category, 'profile': ''})
    );
    
  }

  @override
  Future<String> deletedProduto(Produtos id) {
    // TODO: implement deletedProduto
    throw UnimplementedError();
  }
}
