import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _precoAlcool= TextEditingController();
  TextEditingController _precoGasolina= TextEditingController();
  String _texto_resultado= "";

  void _calcular(){
    double preco_a= double.parse(_precoAlcool.text);
    double preco_g= double.parse(_precoGasolina.text);
    double result= preco_a / preco_g;
    if(result>= 0.7){
      setState(() {
        _texto_resultado= "É melhor abastecer com gasolina";
      });
    }else{
      setState(() {
        _texto_resultado= "É melhor abastecer com álcool";
      });
    }
    _limpar_campos();
  }

  void _limpar_campos(){
    _precoAlcool.text= "";
    _precoGasolina.text= "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 32, right: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _precoAlcool,
                decoration: InputDecoration(
                    labelText: "Digite o preço do álcool:"
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _precoGasolina,
                decoration: InputDecoration(
                    labelText: "Digite o preço da gasolina:"
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: RaisedButton(
                  onPressed: _calcular,
                  color: Colors.lightBlueAccent,
                  child: Text("Calcular"),
                  textColor: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _texto_resultado,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
