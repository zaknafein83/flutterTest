import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyThirdPage(),
    );
  }
}

class MyThirdPage extends StatefulWidget {
  @override
  _MyThirdPageState createState() => _MyThirdPageState();
}

class _MyThirdPageState extends State<MyThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
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
                    "Ultima pagina, adesso accederemo alla vera e propria applicazione!",
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
                      Navigator.popAndPushNamed(context, '/sp');
                    }),
              ]),
              Column(children: [
                FlatButton(
                    child: Text(
                      "Fine",
                    ),
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      print("clicked");
                      Navigator.pushNamed(context, '/login');
                    }),
              ])
            ]),
          ],
        ),
      )),
    );
  }
}
