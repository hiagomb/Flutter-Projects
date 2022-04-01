import 'dart:math';

import 'package:cara_coroa/tela_secundaria.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TelaPrincipal()
  ));
}



class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  void _exibirResultado(){
    double result= Random().nextDouble();
    String imagem = "";
    if(result> 0.5){
      imagem= "images/moeda_cara.png";
    }else{
      imagem= "images/moeda_coroa.png";
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => TelaSecundaria(imagem)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.png"),
            Padding(
                padding: EdgeInsets.only(top: 32),
              child: GestureDetector(
                onTap: _exibirResultado,
                child: Image.asset("images/botao_jogar.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}


