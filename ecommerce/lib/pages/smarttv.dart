import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class SmartTv extends StatelessWidget {
  SmartTv({super.key});

  final List<Map<String, dynamic>> products = [
    {
      "image": "assets/img/category/smarttv/01.webp",
      "title": "Smart TV top 1",
      "description": "Qualidade na sua imagem",
      "price": 5000.00,
      "discount": 30
    },
    {
      "image": "assets/img/category/smarttv/02.webp",
      "title": "Smart TV top 2",
      "description": "Qualidade e momentos incríveis",
      "price": 3000.00,
      "discount": 20
    },
    {
      "image": "assets/img/category/smarttv/03.webp",
       "title": "Smart TV top 3",
      "description": "O que há de melhor, experimente",
      "price": 8000.00,
      "discount": 10
    },
    {
      "image": "assets/img/category/smarttv/04.webp",
      "title": "Smart TV top 4",
      "description": "Garantia de momentos felizes",
      "price": 6500.00,
      "discount": 15
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        backgroundColor: Color.fromRGBO(109, 68, 166, 1),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Container(
            color: Color.fromRGBO(109, 68, 166, 1),
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    //retorna para a tela anterior
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Smart TV",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    
      body: GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: products.map((product) => Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(156, 131, 192, 0.10),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                //linha da porcentagem de desconto e do botão de curtir
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(109, 68, 166, 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "-${product['discount']}%",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //botão favoritos
                    const LikeButton(
                     animationDuration: Duration(seconds: 0)
                    )
                  ],
                ),

                //imagem do produto inclusa em container card
                Expanded(
                  child: Material(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(
                          product['image'],
                          height: 120,
                          width: 120,
                        ),
                      ),
                    ),
                  ),
                ),

                //titulo do produto em card
               Container(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      product['title'],
      style: const TextStyle(
        fontSize: 15,
        color: Color.fromRGBO(109, 68, 166, 1),
        fontWeight: FontWeight.bold,
      ),
    )),

//descrição do produto de card
Container(
  alignment: Alignment.centerLeft,
  child: Text(
    product['description'],
    style: const TextStyle(
        fontSize: 12, color: Color.fromRGBO(109, 68, 166, 1)),
  ),
),

Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "R\$${product['price']}",
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(109, 68, 166, 1)),
          ),
          const Icon(
            Icons.shopping_cart_checkout,
            color: Color.fromRGBO(109, 68, 166, 1),
          ),
        ])),
              ],
            ),
          )).toList(),
    ),
    );
  }
}
