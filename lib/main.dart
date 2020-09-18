import 'package:flutter/material.dart';
import 'package:flutterTest/introduzione.dart';
import 'package:flutterTest/login.dart';
import 'package:flutterTest/secondaPagina.dart';
import 'package:flutterTest/terzaPagina.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestione attività tramite Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Gestione attività tramite Firebase'),
      // home: Introduzione(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => Introduzione(),
        '/sp': (context) => SecondPage(),
        '/tp': (context) => ThirdPage(),
        '/login': (context) => Login(),
      },
    );
  }
}
