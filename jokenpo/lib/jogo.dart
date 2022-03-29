import 'dart:math';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _imagem_app= AssetImage("images/padrao.png");
  var _textUser= "Sua escolha:";

  void _sorteio(String escolha_usuario){
    var lista= ["images/pedra.png", "images/papel.png", "images/tesoura.png"];
    var index= Random().nextInt(3);
    setState(() {
      _imagem_app= AssetImage(lista[index]);
    });
    if(escolha_usuario == "pedra"){
      if(index == 0){
        setState(() {
          _textUser= "Empate";
        });
      }else if(index == 1){
        setState(() {
          _textUser= "Você perdeu";
        });
      }else{
        setState(() {
          _textUser= "Você ganhou";
        });
      }
    }else if(escolha_usuario == "papel"){
      if(index == 0){
        setState(() {
          _textUser= "você ganhou";
        });
      }else if(index == 1){
        setState(() {
          _textUser= "Empate";
        });
      }else{
        setState(() {
          _textUser= "Você perdeu";
        });
      }
    }else{
      if(index == 0){
        setState(() {
          _textUser= "Você perdeu";
        });
      }else if(index == 1){
        setState(() {
          _textUser= "você ganhou";
        });
      }else{
        setState(() {
          _textUser= "Empate";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(16),
            child:  Text(
              "Escolha do App:",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),
            )
            ),
            Image(image: _imagem_app),
            Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
                child:  Text(
                  _textUser,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: ()=> _sorteio("pedra"),
                  child: Image.asset("images/pedra.png", height: 100),
                ),
                GestureDetector(
                  onTap: ()=> _sorteio("papel"),
                  child: Image.asset("images/papel.png", height: 100),
                ),
                GestureDetector(
                  onTap: ()=> _sorteio("tesoura"),
                  child: Image.asset("images/tesoura.png", height: 100),
                ),
              ],
            )
          ],
        ),
      ),
    );;
  }
}
