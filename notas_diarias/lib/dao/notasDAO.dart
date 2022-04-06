import 'package:notas_diarias/helper/AnotacaoHelper.dart';
import 'package:notas_diarias/model/notas.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class NotasDAO{

  Database? db;


   Future<int?> salvar(Notas nota) async{
      db= await AnotacaoHelper().db;
      int? result= await db?.rawInsert("INSERT INTO notas(titulo, descricao, data) "
          "VALUES(?, ?, ?)", [nota.titulo, nota.descricao, nota.data]);

      return result!;
  }


  Future<int?> editar(Notas nota) async{
    db= await AnotacaoHelper().db;
    int? result= await db?.rawUpdate("UPDATE notas SET titulo = ?, descricao = ? WHERE id = ?",
        [nota.titulo, nota.descricao, nota.id]);

    return result!;
  }


  Future<int?> deletar(id) async{
    db= await AnotacaoHelper().db;
    int? result= await db?.rawDelete("DELETE FROM notas WHERE id = ?", [id]);
    return result!;
  }


  Future<List<Notas>> listarNotas() async{
    db= await AnotacaoHelper().db;
    List? lista= await db?.rawQuery("select * from notas");
    List<Notas> lista_notas= [];
    initializeDateFormatting("pt_BR");
    for(var nota in lista!){
      Notas n= Notas(nota["titulo"], nota["data"], nota["descricao"]);
      n.id= nota["id"];
      n.data = DateFormat("d/M/y H:mm:s").format(DateTime.parse(n.data));
      lista_notas.add(n);
    }
    return lista_notas;
  }

}