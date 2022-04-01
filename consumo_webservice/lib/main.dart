import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: TelaPrincipal(),
  ));
}


class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  TextEditingController _controller_cep= TextEditingController();
  bool enabled= false;
  Color cor_botao = Colors.white10;
  String _result= "";

  void recuperar_cep(String cep) async{
    String _url= "https://viacep.com.br/ws/${cep}/json";

    Uri uri= Uri.parse(_url);

    Http.Response response= await Http.get(uri);
    Map<String, dynamic> texto= json.decode(response.body);

    setState(() {
      _result = texto["localidade"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo Web Service"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (String val){
                if(val.length== 8){
                  setState(() {
                    enabled= true;
                    cor_botao = Colors.lightBlueAccent;
                  });
                }else{
                  setState(() {
                    enabled= false;
                    cor_botao = Colors.white10;
                  });
                }
              },
              decoration: InputDecoration(
                labelText:"Digite um cep"
              ),
              controller: _controller_cep,
            ),
            RaisedButton(
                onPressed: (){
                  if(enabled == true){
                    recuperar_cep(_controller_cep.text);
                  }
                },
              child: Text("Consultar",
              style: TextStyle(
                color: Colors.white
              ),
              ),
              color: cor_botao,
            ),
            Padding(
                padding: EdgeInsets.all(32),
                child: Text(_result),
            )
          ],
        ),
      ),
    );
  }
}



