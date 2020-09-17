import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySecondPage(),
    );
  }
}

class MySecondPage extends StatefulWidget {
  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Questa è la seconda pagina della navigazione",
                  ),
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(children: [
                FlatButton(
                    child: Text(
                      "Precedente",
                    ),
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      print("clicked");
                      Navigator.pop(context);
                    }),
              ]),
              Column(children: [
                FlatButton(
                    child: Text(
                      "Prosegui",
                    ),
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      print("clicked");
                      Navigator.push(context,
                          MaterialPageRoute<void>(builder: (context) {
                        return SecondPage();
                      }));
                    }),
              ])
            ]),
          ],
        ),
      )),
    );
  }
}
