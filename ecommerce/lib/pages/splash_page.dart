import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}):super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((_) => Navigator.of(context).pushReplacementNamed('/login')
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(162, 231, 161, 231),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white54,
        ),
      ),

    );
  }
}
