import 'package:flutter/material.dart';

class Introduzione extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBodyHomepage(),
    );
  }
}

class MyBodyHomepage extends StatefulWidget {
  @override
  _MyBodyHomepageState createState() => _MyBodyHomepageState();
}

class _MyBodyHomepageState extends State<MyBodyHomepage> {
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
                    "Questa App serve per mostrare le potenzialità di Flutter, in modo semplice ed efficace",
                  ),
                )
              ],
            ),
            Row(children: [
              Expanded(
                child: Text(
                  "Qui potrebbe esserci una breve descrizione che riempie il contenitore centrale",
                ),
              ),
            ]),
            // ho volutamente lasciato sia l'inkwll che il flatbutton per mostrare la differenza tra i due sistemi di implementazione
            Row(children: [
              Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  InkWell(
                      onTap: () {
                        print("ho cliccato su prosegui");
                      },
                      child: Text(
                        "Prosegui",
                      )),
                  FlatButton(
                      child: Text(
                        "Prosegui",
                      ),
                      color: Colors.lightBlueAccent,
                      onPressed: () {
                        print("clicked");
                        Navigator.pushNamed(context, '/secondaSchermata');
                      }),
                ]),
              )
            ]),
          ],
        ),
      )),
    );
  }
}
