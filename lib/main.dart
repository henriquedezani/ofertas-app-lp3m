import 'package:flutter/material.dart';
import 'package:ofertas_app/login.page.dart';
import 'package:ofertas_app/home.page.dart';
import 'package:ofertas_app/detalhe.page.dart';
import 'package:ofertas_app/cadastro.page.dart';

void main() {
  runApp(MyApp()); // Qual é a classe que será carregada (exibida).
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LoginPage(),
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/detalhe': (context) => DetalhePage(),
        '/cadastro': (context) => CadastroPage(),
      },
      initialRoute: '/',
    );
  }
}
