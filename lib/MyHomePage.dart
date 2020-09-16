import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  _HomePageState createState() => _HomePageState();
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Questa è la Slivers'),
            )
          ],
        ));
  }
}

class _HomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {}
}
