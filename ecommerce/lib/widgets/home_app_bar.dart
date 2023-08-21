 
 import 'package:flutter/material.dart';
 import 'package:badges/badges.dart' as badge;

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        //espaço para alterações do app Bar/topo/header
        children: [
          const Icon(Icons.sort, size: 30, color: Color.fromRGBO(109,68,166,1)),
          const Padding(padding: EdgeInsets.only(left: 10,),
              child: Text('Tech Ladies Shop', style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(109,68,166,1),
              ),
              ),
          ),
          const Spacer(),
          badge.Badge(
            badgeStyle: const badge.BadgeStyle(badgeColor: Colors.red, padding: EdgeInsets.all(5)),
            badgeContent: const Text("3", style: TextStyle(color: Colors.white),),
            child: InkWell(
              onTap: (){},
              child: const Icon(Icons.shopping_cart, size: 25, color: Color.fromRGBO(109,68,166,1)),
              ),
          ),
        ],
        
      ),
    );
  }
}