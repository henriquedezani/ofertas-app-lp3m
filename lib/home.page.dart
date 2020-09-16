// 1. IMPORTAR AS BIBLIOTECAS QUE UTILIZAREI NA TELA
// 2. CRIAR A CLASSE QUE HERDE DE **STATELESSWIDGET** OU STATEFULWIDGET
// 3. IMPLEMENTAR O MÉTODO BUILD DA CLASSE
// 4. RETORNAR O WIDGET QUE DESEJA MOSTRAR NA TELA DENTRO DO MÉTODO BUILD.

import 'package:flutter/material.dart';
import 'package:ofertas_app/itemoferta.widget.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Ofertas"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ItemOferta(),
          ItemOferta(),
          ItemOferta(),
          ItemOferta(),
          ItemOferta(),
          ItemOferta(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Nova Oferta",
        onPressed: () {
          Navigator.of(context).pushNamed('/cadastro');
        },
      ),
    );
  }
}
