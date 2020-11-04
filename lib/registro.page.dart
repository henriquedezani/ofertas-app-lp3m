import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String nome, email, senha;

  var _formKey = GlobalKey<FormState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  String exibeErroEmPortugues(String code) {
    switch (code) {
      case "email-already-in-use":
        return "Já existe um usuário com este e-mail.";
      case "invalid-email":
        return "E-mail inválido.";
      case "operation-not-allowed":
        return "Operação não permitida. Verifique com o admin.";
      case "weak-password":
        return "Senha fraca. Refaça.";
      default:
        return "Ops, aconteceu um erro.";
    }
  }

  @override
  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: larguraTela > 500 ? 400 : larguraTela,
            margin: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.camera_alt, size: 70),
                  ),
                  Text("Clique para alterar"),
                  SizedBox(height: 50),
                  TextFormField(
                    validator: (value) =>
                        value.isEmpty ? "Campo obrigatório" : null,
                    decoration: InputDecoration(
                      labelText: "Nome",
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => nome = value,
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    validator: (value) =>
                        value.isEmpty ? "Campo obrigatório" : null,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      border: OutlineInputBorder(),
                      // labelStyle: TextStyle(color: Colors.red),
                    ),
                    onSaved: (value) => email = value,
                    // style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    validator: (value) =>
                        value.isEmpty ? "Campo obrigatório" : null,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => senha = value,
                    obscureText: true,
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          try {
                            var credentials =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: senha);
                            await credentials.user
                                .updateProfile(displayName: nome);
                            Navigator.of(context).pushNamed('/home');
                          } on FirebaseAuthException catch (ex) {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(exibeErroEmPortugues(ex.code)),
                            ));
                          }
                        }
                      },
                      child: Text(
                        "Registrar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Já tem conta?"),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Clique aqui.",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
