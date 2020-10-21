import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  final FirebaseFirestore database = FirebaseFirestore.instance;

  String nome;
  String empresa;
  double preco;
  String descricao;
  String uid = "123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nova Oferta",
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (formKey.currentState.validate()) {
                // invocar os métodos onSave de cada TextFormField:
                formKey.currentState.save();

                // ~ INSERT INTO Ofertas VALUES (nome, empresa, preco, de...)
                database.collection('ofertas').add({
                  "nome": nome,
                  "empresa": empresa,
                  "preco": preco,
                  "descricao": descricao,
                  "uid": uid,
                  "avaliacao": 0,
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
