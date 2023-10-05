class Produtos {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;

  const Produtos(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.category});

  factory Produtos.fromJson(Map<String, dynamic> json) {
    return Produtos(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        category: json['category']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dados = <String, dynamic>{};
    dados['id'] = id;
    dados['title'] = title;
    dados['description'] = description;
    dados['price'] = price;
    dados['category'] = category;

    return dados;
  }
}
