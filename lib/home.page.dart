// 1. IMPORTAR AS BIBLIOTECAS QUE UTILIZAREI NA TELA
// 2. CRIAR A CLASSE QUE HERDE DE **STATELESSWIDGET** OU STATEFULWIDGET
// 3. IMPLEMENTAR O MÉTODO BUILD DA CLASSE
// 4. RETORNAR O WIDGET QUE DESEJA MOSTRAR NA TELA DENTRO DO MÉTODO BUILD.

import 'package:flutter/material.dart';
import 'package:ofertas_app/itemoferta.widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ofertas_app/models/oferta.model.dart';

class HomePage extends StatelessWidget {
  final FirebaseFirestore database = FirebaseFirestore.instance; // singleton

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Ofertas"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: database.collection('ofertas').orderBy('nome').snapshots(),
        builder: (_, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              Oferta _oferta =
                  Oferta.fromJson(snapshot.data.docs[index].data());
              return ItemOferta(_oferta);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        tooltip: "Nova Oferta",
        onPressed: () {
          Navigator.of(context).pushNamed('/cadastro');
        },
      ),
    );
  }
}
