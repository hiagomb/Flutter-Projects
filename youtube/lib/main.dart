import 'package:flutter/material.dart';
import 'package:youtube/custom_search_delegate.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/em_alta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricao.dart';

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

  int current_index = 0;
  String resultado= "";

  @override
  Widget build(BuildContext context) {
    List<Widget> lista= [
      Inicio(resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Image.asset(
            "images/youtube.png",
          height: 22,
        ),
        actions: [
          // IconButton(
          //     onPressed: (){},
          //     icon: Icon(Icons.videocam)
          // ),
          IconButton(
              onPressed: () async{
                String? pesquisa = await showSearch(context: context, delegate: CustomSearchDelegate());
                setState(() {
                  resultado = pesquisa!;
                });
              },
              icon: Icon(Icons.search)
          ),
          // IconButton(
          //     onPressed: (){},
          //     icon: Icon(Icons.account_circle)
          // )
        ],
      ),
      body: lista[current_index], 
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        currentIndex: current_index,
        onTap: (index){
          setState(() {
            current_index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Inicio",
              icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Em alta",
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            label: "Inscrições",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}



