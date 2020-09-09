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
      body: Container(
        margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
        padding: EdgeInsets.all(8),
        //color: Colors.white,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(4, 4),
                blurRadius: 12,
              ),
            ]),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://via.placeholder.com/100x100.png?text=Produto1',
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Computador Dell Vostro 1400, Intel i9, 16GB RAM e 1TB SSD",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "www.kabum.com.br",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
                Icon(Icons.thumb_up, size: 16),
                Text(
                  "R\$ 1560,00",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
