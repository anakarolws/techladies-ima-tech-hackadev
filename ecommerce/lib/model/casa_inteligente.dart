class CasaInteligente {
  String? title;
  String? description;
  double price;
  double? discount;
  String? image;

  CasaInteligente(
      {required this.title,
      required this.description,
      required this.price,
      required this.discount,
      required this.image});

  @override
  String toString() {
   
    return 'Casa Inteligente';
  }
}
