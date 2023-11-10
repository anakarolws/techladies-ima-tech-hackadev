class Produtos {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String profile;

  const Produtos(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.category,
      required this.profile});

  factory Produtos.fromJson(Map<String, dynamic> json) {
    return Produtos(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        category: json['category'],
        profile: json['profile']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dados = <String, dynamic>{};
    dados['id'] = id;
    dados['title'] = title;
    dados['description'] = description;
    dados['price'] = price;
    dados['category'] = category;
    dados['profile'] = profile;

    return dados;
  }
}
