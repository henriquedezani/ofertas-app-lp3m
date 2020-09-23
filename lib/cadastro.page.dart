import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

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
                // TODO: Salvar os dados no banco de dados (Firestore)
                // TODO: Mostrar uma mensagem de sucesso.
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Container(
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
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Campo obrigatório";
                  } else {
                    return null;
                  }
                },
                autovalidate: false,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Loja",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value.isEmpty ? 'Campo obrigatório' : null,
                autovalidate: false,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Preço",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value.isEmpty) return "Campo Obrigatório";

                  var _value = double.tryParse(value);
                  if (_value != null && _value < 0)
                    return "Valor deve ser maior que zero.";

                  return null;
                },
                autovalidate: false,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Descrição",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]),
                  ),
                  // prefixIcon: Icon(Icons.person),
                  // suffixIcon: Icon(Icons.check),
                ),
                minLines: 1,
                maxLines: 5,
                maxLength: 10,
                enabled: true,
                keyboardType: TextInputType.multiline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
