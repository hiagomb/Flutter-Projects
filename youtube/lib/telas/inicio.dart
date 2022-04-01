import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';

import '../model/Video.dart';


class Inicio extends StatefulWidget {
  String pesquisa;

  Inicio(this.pesquisa);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {


  @override
  Widget build(BuildContext context) {
    Api api = Api();
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder<List<Video>>(
                    future: api.pesquisar(widget.pesquisa),
                    builder: (context, snapshot){
                      List<Video>? lista= snapshot.data;
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                          itemCount: lista?.length,
                          itemBuilder: (context, index){
                            Video v= lista![index];
                            return Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                                  child:Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(v.imagem),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ),

                                ),
                                ListTile(
                                  title: Text(v.titulo),
                                )
                              ],
                            );
                          }
                      );

                    }
                )
            )
          ],
        ),
      ),
    );
  }
}
