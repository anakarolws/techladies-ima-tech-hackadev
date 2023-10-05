import 'package:ecommerce/model/produtos/produtos.dart';

abstract class ProdutosRepository {
  Future<List<Produtos>> getProdutos();
  Future<String> getProdutosById(Produtos id);
  Future<void> postProdutos(String title, String description, double price, String category);
  Future<String> deletedProduto(Produtos id);
}
