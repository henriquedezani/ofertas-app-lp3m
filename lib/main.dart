import 'package:flutter/material.dart';
import 'package:ofertas_app/edicao.page.dart';
import 'package:ofertas_app/login.page.dart';
import 'package:ofertas_app/home.page.dart';
import 'package:ofertas_app/detalhe.page.dart';
import 'package:ofertas_app/cadastro.page.dart';
import 'package:ofertas_app/registro.page.dart';

void main() {
  runApp(MyApp()); // Qual é a classe que será carregada (exibida).
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LoginPage(),
      routes: {
        '/': (context) => LoginPage(),
        '/registro': (context) => RegistroPage(),
        '/home': (context) => HomePage(),
        '/detalhe': (context) => DetalhePage(),
        '/cadastro': (context) => CadastroPage(),
        '/edicao': (context) => EdicaoPage(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.red,
      ),
    );
  }
}

//https://pub.dev/packages/flutter_rating_bar
