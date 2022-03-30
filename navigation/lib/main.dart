import 'package:flutter/material.dart';
import 'package:navigation/tela_secundaria.dart';

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira Tela"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=> TelaSecundaria()
                      )
                  );
                },
              color: Colors.lightBlueAccent,
              child: Text("Ir para segunda tela"),
            )
          ],
        ),
      ),
    );
  }
}



