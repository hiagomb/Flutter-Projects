import 'package:flutter/material.dart';
import 'package:notas_diarias/dao/notasDAO.dart';
import 'package:notas_diarias/helper/AnotacaoHelper.dart';
import 'package:notas_diarias/model/notas.dart';
import 'package:sqflite/sqflite.dart';

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

  TextEditingController controller_titulo= TextEditingController();
  TextEditingController controller_descricao= TextEditingController();
  NotasDAO dao= NotasDAO();
  List<Notas> lista= [];

  _getLista() async{
    List<Notas> temp= await dao.listarNotas();
    setState(() {
      lista = temp;
    });

    print(lista[0].descricao);
  }


  _show_cadastro(int index){
    if(index!= -1){
      setState(() {
        controller_titulo.text = lista[index].titulo;
        controller_descricao.text= lista[index].descricao;
      });
    }else{
      setState(() {
        controller_titulo.clear();
        controller_descricao.clear();
      });
    }
    showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Adicionar anotação"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  autofocus: true,
                  controller: controller_titulo,
                  decoration: InputDecoration(
                      labelText: "Título"
                  ),
                ),
                TextField(
                  controller: controller_descricao,
                  decoration: InputDecoration(
                      labelText: "Descrição"
                  ),
                ),
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar")
              ),
              FlatButton(
                  onPressed: () async{
                    if(index == -1){
                      Notas nota= Notas(controller_titulo.text, DateTime.now().toString(), controller_descricao.text);
                      if((await dao.salvar(nota))! > 0){
                        controller_titulo.text= "";
                        controller_descricao.text= "";
                      }
                    }else{
                      Notas n= Notas(controller_titulo.text, lista[index].data, controller_descricao.text);
                      n.id= lista[index].id;
                      if((await dao.editar(n))! > 0){
                        controller_titulo.text= "";
                        controller_descricao.text= "";
                      }
                    }
                    Navigator.pop(context);
                    await _getLista();
                  },
                  child: Text("Salvar")
              ),
            ],
          );
        }
    );
  }


  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _getLista();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Anotações"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                      itemCount: lista.length,
                        itemBuilder: (context, index){
                          Notas nota= lista[index];
                          return Card(
                            child: ListTile(
                              title: Text(nota.titulo),
                              subtitle: Text(nota.data+" - "+nota.descricao),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      _show_cadastro(index);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 16),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async{
                                      await dao.deletar(lista[index].id);
                                      _getLista();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 0),
                                      child: Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    )
                )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.add),
        onPressed: (){
          _show_cadastro(-1);
        },
      ),
    );
  }
}


