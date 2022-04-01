import 'package:cara_coroa/main.dart';
import 'package:flutter/material.dart';


class TelaSecundaria extends StatefulWidget {
  String _caminho_imagem= "";

  TelaSecundaria(String caminho_imagem){
    this._caminho_imagem= caminho_imagem;
  }

  @override
  State<TelaSecundaria> createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget._caminho_imagem),
          Padding(
              padding: EdgeInsets.only(top: 32),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Image.asset("images/botao_voltar.png"),
            ),
          )
          ],
        ),
      ),
    );
  }
}
