import 'package:ecommerce/model/produtos/produtos.dart';
import 'package:ecommerce/repository/produtos_repository.dart';

class ProdutoController {
  final ProdutosRepository _repository;

  ProdutoController(this._repository);

  Future<List<Produtos>> fetchProdutosList() async {
    return _repository.getProdutos();
  }

  Future<void> fetchProdutosPost(
      String title, String description, double price, String category) async {
    return _repository.postProdutos(title, description, price, category);
  }
}
