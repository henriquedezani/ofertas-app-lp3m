import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ofertas_app/models/oferta.model.dart';

class ItemOferta extends StatelessWidget {
  FirebaseFirestore _database = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final Oferta oferta;
  final GlobalKey<ScaffoldState> scaffoldKey;

  ItemOferta(this.scaffoldKey, this.oferta);

  void confirmaExclusao(BuildContext context, String id) {
    final _dialog = AlertDialog(
      title: Text("Confirma a exclusão?"),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        RaisedButton(
          color: Colors.red,
          child: Text(
            "Confirmar",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            // ~ DELETE FROM Ofertas WHERE id = <123>
            _database.collection('ofertas').doc(oferta.id).delete();
            Navigator.of(context).pop();
          },
        )
      ],
    );
    showDialog(context: context, child: _dialog);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/detalhe", arguments: oferta.id);
      },
      onLongPress: () {
        if (_auth.currentUser.uid == oferta.uid) {
          scaffoldKey.currentState.showBottomSheet(
            (context) => Container(
              height: 120,
              color: Colors.white,
              child: ListView(
                children: [
                  ListTile(
                    title: Text("Editar"),
                    leading: Icon(Icons.edit),
                    onTap: () {
                      // TODO: Desafio -> Implementar uma tela de edição de oferta.
                      // Valendo 1 ponto na média.
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: Text("Apagar", style: TextStyle(color: Colors.red)),
                    leading: Icon(Icons.delete, color: Colors.red),
                    onTap: () => confirmaExclusao(context, oferta.id),
                  )
                ],
              ),
            ),
          );
        }
      },
      child: Container(
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        oferta.nome,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        oferta.empresa,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.thumb_up, size: 16),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            oferta.likes.toString() == "0"
                                ? "Seja o primeiro a curtir"
                                : oferta.likes.toString(),
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      Text(
                        "R\$ ${oferta.preco}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            GestureDetector(
              // onTap: () => Navigator.of(context).pushNamed('/cadastro'),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://imagens.canaltech.com.br/celebridades/78.400.jpg'),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        oferta.nomeUsuario,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "26 de agosto de 20202",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore _database = FirebaseFirestore.instance;

Stream = _database.collection('ofertas').snapshots(); // SELECT (em tempo real)
Future = _database.collection('ofertas').get(); // SELECT (única vez)
_database.collection('ofertas').add({"nome": ..., }); // INSERT
_database.collection('ofertas').doc(documentID).delete(); // DELETE
_database.collection('ofertas').doc(documentID).update({"nome": ..., }); // UPADTE

*/
