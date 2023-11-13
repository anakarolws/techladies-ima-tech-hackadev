import 'package:ecommerce/model/produtos/produtos.dart';
import 'package:image_picker/image_picker.dart';
import 'package:async/async.dart';

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
      produto['price'] = double.parse(produto['price'].toString());
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
  Future<void> postProdutos(String title, String description, double price,
      String category, String profile, XFile arquivoImagem) async {
    var request = http.MultipartRequest("POST", Uri.parse(dataUrl));
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['price'] = price.toString();
    request.fields['profile'] = profile;
    request.fields['category'] = category;

    var stream =
        http.ByteStream(DelegatingStream.typed(arquivoImagem.openRead()));
    var length = await arquivoImagem.length();
    var multipartFileSign = http.MultipartFile('file', stream, length,
        filename: arquivoImagem.name);

    request.files.add(multipartFileSign);

    var response = await request.send();
    if (response.statusCode == 200) print('Uploaded!');
  }

  @override
  Future<Produtos> deletedProduto(int id) async {
      var url = Uri.parse("$dataUrl$id");
      var response = await http.delete(url);

      var produto = json.decode(response.body);
      produto['price'] = double.parse(produto['price'].toString());

      return produto;

  }

  @override
  Future<List<Produtos>> selecionarProdutoCategoria(String categoria) async {
    List<Produtos> produtosList = [];
    var url =
        Uri.parse("${dataUrl}category?category=$categoria");
    print(url);
    var response = await http.get(url);
    //print('status code: ${response.statusCode}');
    var body = json.decode(response.body);

    for (var produto in body) {
      produto['price'] = double.parse(produto['price'].toString());
      //produto ['profile'] = 'https://picsum.photos/250?image=9';
      produtosList.add(Produtos.fromJson(produto));
    }

    return produtosList;
  }

  @override
  Future<List<dynamic>> buscarProdutosPorTermo(String searchTerm) async {

    final response =
        await http.get(Uri.parse("$dataUrl?search=$searchTerm"), headers: {
      "Accept": "application/json",
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Falha ao carregar produtos');
    }
  }
}
