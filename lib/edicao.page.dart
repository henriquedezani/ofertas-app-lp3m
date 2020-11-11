import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ofertas_app/models/oferta.model.dart';

class EdicaoPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  final FirebaseFirestore database = FirebaseFirestore.instance;

  String nome;
  String empresa;
  double preco;
  String descricao;

  @override
  Widget build(BuildContext context) {
    Oferta oferta = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Editar Oferta",
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (formKey.currentState.validate()) {
                // invocar os métodos onSave de cada TextFormField:
                formKey.currentState.save();

                // ~ UPDATE Ofertas SET nome=, empresa=, preco=, descricao=.. WHERE id=...
                database.collection('ofertas').doc(oferta.id).update({
                  "nome": nome,
                  "empresa": empresa,
                  "preco": preco,
                  "descricao": descricao
                });

                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.network(
                    'https://via.placeholder.com/200x200.png?text=Produto1'),
                SizedBox(height: 20),
                TextFormField(
                  initialValue: oferta.nome,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Campo obrigatório";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) => nome = value,
                ),
                SizedBox(height: 20),
                TextFormField(
                  initialValue: oferta.empresa,
                  decoration: InputDecoration(
                    labelText: "Loja",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value.isEmpty ? 'Campo obrigatório' : null,
                  onSaved: (value) => empresa = value,
                ),
                SizedBox(height: 20),
                TextFormField(
                  initialValue: oferta.preco.toString(),
                  decoration: InputDecoration(
                    labelText: "Preço",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) return "Campo Obrigatório";

                    var _value = double.tryParse(value);
                    if (_value != null && _value < 0)
                      return "Valor deve ser maior que zero.";

                    return null;
                  },
                  onSaved: (value) => preco = double.tryParse(value),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                TextFormField(
                  initialValue: oferta.descricao,
                  decoration: InputDecoration(
                    labelText: "Descrição",
                    border: OutlineInputBorder(),
                    // prefixIcon: Icon(Icons.person),
                    // suffixIcon: Icon(Icons.check),
                  ),
                  minLines: 3,
                  maxLines: 5,
                  // maxLength: 10,
                  enabled: true,
                  keyboardType: TextInputType.multiline,
                  onSaved: (value) => descricao = value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
