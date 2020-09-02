import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: FlatButton(
          child: Text("Ir para Home"),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
        ),
      ),
    );
  }
}
