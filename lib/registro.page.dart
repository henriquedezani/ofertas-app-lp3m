import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
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
                    obscureText: true,
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {}
                        // Navigator.of(context).pushNamed('/home');
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
