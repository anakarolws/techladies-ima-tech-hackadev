import 'package:ecommerce/model/dados_produtos.dart';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class SmartTvPage extends StatelessWidget {
  const SmartTvPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(109, 68, 166, 1),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Smart TV's",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(109, 68, 166, 1),              
            ),
          ),
        ),
      ),
    
   body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.78),
        itemCount: smartTv.length,
        itemBuilder: (context, index) {
          return Card(
            
             shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color.fromRGBO(109, 68, 166, 1), width: 1),
              borderRadius: BorderRadius.circular(10.0),
            ),

            child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(109, 68, 166, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "-${smartTv[index].discount}%",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const LikeButton(
                     animationDuration: Duration(seconds: 0)
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Image.asset(
                  smartTv[index].image!,
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(smartTv[index].title!,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(109, 68, 166, 1),
                        fontWeight: FontWeight.bold))),
            Container(
              alignment: Alignment.center,
              child: Text(smartTv[index].description!,
                  style: const TextStyle(
                      fontSize: 12, color: Color.fromRGBO(109, 68, 166, 1))),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("R\$${smartTv[index].price}",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(109, 68, 166, 1))),
                      const Icon(Icons.shopping_cart_checkout,
                          color: Color.fromRGBO(109, 68, 166, 1)),
                    ])),
          ]));
        },
      ),
    );
  }
}