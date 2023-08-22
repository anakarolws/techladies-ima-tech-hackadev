import 'package:flutter/material.dart';

class CustomButtom extends StatefulWidget {
  const CustomButtom({Key? key}) : super(key: key);

  @override
  State<CustomButtom> createState() => _CustomButtomState();
}

class _CustomButtomState extends State<CustomButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 80,
      color: Colors.amber,
    );
  }
}
