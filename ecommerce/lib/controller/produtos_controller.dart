import 'package:ecommerce/model/produtos/produtos.dart';
import 'package:ecommerce/repository/produtos_repository.dart';
import 'package:image_picker/image_picker.dart';

class ProdutoController {
  final ProdutosRepository _repository;

  ProdutoController(this._repository);

  Future<List<Produtos>> fetchProdutosList() async {
    return _repository.getProdutos();
  }

  Future<void> fetchProdutosPost(String title, String description, double price,
      String category, String profile, XFile arquivoImagem) async {
    return _repository.postProdutos(
        title, description, price, category, profile, arquivoImagem);
  }

  Future<List<Produtos>> fetchProdutosCategoria(String categoria) {
    return _repository.selecionarProdutoCategoria(categoria);
  }

  
  Future<Produtos> deletedProduto(int id) async {
    print('Controller chamando o repository');
    return _repository.deletedProduto(id);
  }
  Future<List<dynamic>> buscarProdutosPorTermo(String searchTermo) async {
    print('Iniciando a busca dos produtos por termo $searchTermo');
    var produtos = await _repository.buscarProdutosPorTermo(searchTermo);
    print(produtos);
    return produtos;

  }

  Future<Produtos> buscarProduto(int? produtoId) async {
    var produtos = await _repository.buscarProduto(produtoId);
    return produtos;
  }
}
