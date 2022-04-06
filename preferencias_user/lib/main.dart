import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: MyHome(),
  ));
}


class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  TextEditingController _controller= TextEditingController();
  String _texto= "Nada salvo";

  void _salvar() async{
      final prefs= await SharedPreferences.getInstance();
      await prefs.setString("texto", _controller.text);
  }

  void _ler(){

  }

  void _remover(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared preferences"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(_texto),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Digite algo",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: _salvar,
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      color: Colors.white
                    ),),
                  color: Colors.lightBlue,
                ),
                RaisedButton(
                  onPressed: _ler,
                  child: Text(
                      "Ler",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  color: Colors.lightBlue,
                ),
                RaisedButton(
                  onPressed: _remover,
                  child: Text(
                    "Remover",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  color: Colors.lightBlue,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



