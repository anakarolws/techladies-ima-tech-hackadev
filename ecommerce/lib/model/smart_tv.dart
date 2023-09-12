class SmartTv {
  String? title;
  String? description;
  double price;
  double? discount;
  String? image;

  SmartTv(
      {required this.title,
      required this.description,
      required this.price,
      required this.discount,
      required this.image});

  @override
  String toString() {
   
    return 'Smart TVs';
  }
}
