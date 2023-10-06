import 'package:flutter/material.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

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
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.white),
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
            const SizedBox(height: 20),
            _buildStarRating(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/agradecimentoPage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(109, 68, 166, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text('Enviar Avaliação'),
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
