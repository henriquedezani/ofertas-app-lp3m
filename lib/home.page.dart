// 1. IMPORTAR AS BIBLIOTECAS QUE UTILIZAREI NA TELA
// 2. CRIAR A CLASSE QUE HERDE DE **STATELESSWIDGET** OU STATEFULWIDGET
// 3. IMPLEMENTAR O MÉTODO BUILD DA CLASSE
// 4. RETORNAR O WIDGET QUE DESEJA MOSTRAR NA TELA DENTRO DO MÉTODO BUILD.

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Ofertas"),
      ),
      body: new Center(
        child: new Text("Hello World"),
      ),
    );
  }
}
