import 'package:flutter/material.dart';
import 'package:flutterTest/schermate/introduzione.dart';
import 'package:flutterTest/schermate/login.dart';
import 'package:flutterTest/schermate/postList.dart';
import 'package:flutterTest/schermate/secondaPagina.dart';
import 'package:flutterTest/schermate/terzaPagina.dart';

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
        '/postList': (context) => PostList(),
      },
    );
  }
}
