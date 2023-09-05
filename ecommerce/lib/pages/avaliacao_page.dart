import 'package:flutter/material.dart';

class ProductReviewScreen extends StatefulWidget {
  @override
  _ProductReviewScreenState createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Avaliações do Produto',
          style: TextStyle(color: Colors.purple),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Quanto mais estrelas, mais você gostou',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(height: 20),
            _buildStarRating(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/agradecimentoPage');
              },
              child: Text('Enviar Avaliação'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(109, 68, 166, 1),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                _rating = i;
              });
            },
            child: Icon(
              i <= _rating ? Icons.star : Icons.star_border,
              size: 40,
              color: Colors.amber,
            ),
          ),
      ],
    );
  }
}