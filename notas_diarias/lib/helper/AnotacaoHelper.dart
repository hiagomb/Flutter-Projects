import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class AnotacaoHelper{

  static final AnotacaoHelper _anotacaoHelper= AnotacaoHelper._internal();
  Database? _db;

  factory AnotacaoHelper(){
    return _anotacaoHelper;
  }

  AnotacaoHelper._internal(){

  }

  get db async{
    if(_db == null){
      var path_system= await getDatabasesPath();
      var pathDb= join(path_system, "mydatabase.db");
      _db= await openDatabase(pathDb, version: 1, onCreate: (db, version){
        db.execute("CREATE TABLE notas(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo VARCHAR, "
            "descricao VARCHAR, data DATETIME)");
      });
    }
    return _db;
  }


}