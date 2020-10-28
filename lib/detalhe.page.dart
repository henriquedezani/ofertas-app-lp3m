import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ofertas_app/models/oferta.model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetalhePage extends StatelessWidget {
  FirebaseFirestore _database = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final String _id = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Oferta"),
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: _database.collection('ofertas').doc(_id).get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            final Oferta _oferta =
                Oferta.fromJson(snapshot.data.id, snapshot.data.data());

            return Column(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                      "https://via.placeholder.com/100x100.png?text=Produto1",
                      fit: BoxFit.cover),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _oferta.nome,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _oferta.empresa,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      SmoothStarRating(
                        rating: _oferta.avaliacao,
                        size: 20,
                        isReadOnly: false,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        starCount: 5,
                        allowHalfRating: true,
                        spacing: 2.0,
                        color: Colors.amber,
                        borderColor: Colors.amber,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(_oferta.descricao),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "R\$ ${_oferta.preco}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            "Ir para a oferta",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
