class SmartPhone {
  String? title;
  String? description;
  double price;
  double? discount;
  String? image;

  SmartPhone(
      {required this.title,
      required this.description,
      required this.price,
      required this.discount,
      required this.image});

  @override
  String toString() {
   
    return 'Smartphones';
  }
}
