import 'package:flutter/material.dart';

class DetalhePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Image.network(
        'https://via.placeholder.com/100x100.png?text=Produto1',
      ),
    );
  }
}
