import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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

  _getDatabase() async{
    final path= await getDatabasesPath();
    final path_db= join(path, "my_database.db");
    var db= await openDatabase(path_db, version: 1, onCreate: (db, index) async{
      await db.execute("CREATE TABLE usuarios(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, years INTEGER)");
    });

    return db;
  }

  _save() async{
    Database db= await _getDatabase();
    Map<String, dynamic> values= Map();
    values["name"] = "Hiago";
    values["years"]= 23;
    await db.insert("usuarios", values);
  }
  
  _fillUsers() async{
    Database db= await _getDatabase();
    List _list= await db.rawQuery("select * from usuarios");
  }


  @override
  Widget build(BuildContext context) {
    _getDatabase();


    return Scaffold(
      appBar: AppBar(
        title: Text("Banco de Dados"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}


