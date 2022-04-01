import 'package:consumo_web_service_future/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
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

  String _url_base= "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuperarPostagens() async{
    Http.Response response= await Http.get(Uri.parse(_url_base+"/posts"));
    var dados_json= json.decode(response.body);
    List<Post> lista = [];
    for(var post in dados_json){
        Post p= Post(post["userId"], post["id"], post["title"], post["body"]);
        lista.add(p);
    }
    return lista;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo Web Service Future"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: (){},
                  child: Text("Salvar"),
                ),
                RaisedButton(
                  onPressed: (){},
                  child: Text("Cancelar"),
                )
              ],
            ),
            Expanded(
                child: FutureBuilder<List<Post>>(
                  future: _recuperarPostagens(),
                  builder: (context, snapshot){
                    List<Post>? lista= snapshot.data;
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }else if(snapshot.connectionState == ConnectionState.active){

                    }else if(snapshot.connectionState == ConnectionState.done){
                      if(snapshot.hasError){

                      }else{

                      }
                    }
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index){
                        Post p= lista![index];

                        return ListTile(
                          title: Text(p.title),
                          subtitle: Text(p.body),
                        );
                      },

                    );
                  },
                ),
            )
          ],
        ),
      )

    );
  }
}

