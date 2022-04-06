import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

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

  List _lista= [];
  TextEditingController _controller= TextEditingController();

  Future<File> _getCaminho() async{
    final diretorio= await getApplicationDocumentsDirectory();
    return File(diretorio.path+"/dados.json");
  }

  _salvar(String texto, bool realizada) async{
    var arquivo= await _getCaminho();

    bool edicao= false;
    for(int i=0; i<_lista.length; i++){
      if(texto == _lista[i]["titulo"]){
        setState(() {
          _lista[i]["realizada"]= realizada;
          edicao= true;
        });
      }
    }

    if(!edicao){
      Map<String, dynamic> tarefa= Map();
      tarefa["titulo"]= texto;
      tarefa["realizada"]= realizada;

      setState(() {
        _lista.add(tarefa);
        _controller.text= "";
      });
    }
    String dados= json.encode(_lista);
    arquivo.writeAsString(dados);
  }

  _remover(List list) async{
    var arquivo= await _getCaminho();
    String dados= json.encode(list);
    arquivo.writeAsString(dados);
  }

  _recuperar() async{
    try{
      var arquivo= await _getCaminho();
      return arquivo.readAsString();
    }catch(e){
      return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _salvar("Ir ao mercado", false);
    // setState(() {
    //   _lista.removeAt(0);
    // });

    _recuperar().then(
        (dados){
          setState(() {
            _lista= json.decode(dados);
            print(_lista);
          });
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: _lista.length,
                    itemBuilder: (context, index){
                    return Dismissible(
                        key: ValueKey(DateTime.now().millisecondsSinceEpoch.toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction){
                          List _list= _lista;

                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Tarefa removida"),
                            action: SnackBarAction(
                              label: "Desfazer",
                              onPressed: (){
                                setState(() {
                                  _lista.add(_lista[index]);
                                });
                                _remover(_lista);
                              },
                            ),
                          ));



                          _list.removeAt(index);
                          _remover(_list);
                        },
                        background: Container(
                          color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                  Icons.restore_from_trash_sharp,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        child:  CheckboxListTile(
                          title: Text(_lista[index]["titulo"]),
                          value: _lista[index]["realizada"],
                          onChanged: (text){
                            setState(() {
                              _lista[index]["realizada"]= text;
                            });
                            _salvar(_lista[index]["titulo"], text!);
                          }
                      )
                    );
                    }
                )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("Adicionar tarefa"),
                  content: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: "Digite uma tarefa"
                    ),
                  ),
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancelar")
                    ),
                    FlatButton(
                        onPressed: (){
                          _salvar(_controller.text, false);
                          Navigator.pop(context);
                        },
                        child: Text("Salvar")
                    ),
                  ],
                );
              }
          );
        },
      ),
    );
  }
}


