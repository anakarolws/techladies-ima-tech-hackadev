import 'package:ecommerce/model/produtos/produtos.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProdutosRepository {
  Future<List<Produtos>> getProdutos();
  Future<String> getProdutosById(Produtos id);
  Future<void> postProdutos(String title, String description, double price,
      String category, String profile, XFile arquivoImagem);
  Future<String> deletedProduto(Produtos id);
  Future<List<Produtos>> selecionarProdutoCategoria(String categoria);
}
