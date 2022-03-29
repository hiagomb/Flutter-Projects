import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _lista= [
    "frase 1",
    "frase 2",
    "frase 3",
    "frase 4"
  ];

  var _frase_gerada= "Clique abaixo para gerar uma frase";

  void _gerarFrase(){
    var index= Random().nextInt(4);
    setState(() {
      _frase_gerada= _lista[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/logo.png"),
            Text(
                _frase_gerada,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
                color: Colors.black
              ),
            ),
            RaisedButton(
              child: Text(
                  "Nova frase",
                style: TextStyle(fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold),
              ),
              color: Colors.green,
              onPressed: _gerarFrase  ,
            )
          ],
        ),
      ),
    );
  }
}



