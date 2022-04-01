import 'package:flutter/material.dart';

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
        title: Text("Listas"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, indice){
              return ListTile(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Título"),
                          content: Text("Item ${indice}"),
                          actions: [
                            FlatButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Sim"))
                          ],
                        );
                      });
                },
                  onLongPress: (){

                  },
                  title: Text("Lista - item número "+indice.toString()
                  )
              );
            }
        ),
      ),
    );
  }
}


