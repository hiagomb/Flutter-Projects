import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controller= TextEditingController();
  bool check= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(32),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Digite um valor"
                  ),
                  enabled: true,
                  onChanged: (String e){
                    //
                  },
                  controller: _controller,
                ),
            ),
            RaisedButton(
                onPressed: (){
                  print("Teste: "+_controller.text);
                },
                child: Text("Salvar"),
              color: Colors.green,
            ),
            Checkbox(
                value: check,
                onChanged: (bool? val){
                  setState(() {
                    check= val!;
                  });
                }
            ),

          ],
        ),
      ),
    );
  }
}
