import 'package:atm_consultoria/tela_cliente.dart';
import 'package:atm_consultoria/tela_contato.dart';
import 'package:atm_consultoria/tela_empresa.dart';
import 'package:atm_consultoria/tela_servico.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage()
  ));
}



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _abrirEmpresa(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TelaEmpresa("Hiago Matheus Brajato")));
  }
  void _abrirServico(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TelaServico()));
  }
  void _abrirCliente(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TelaCliente()));
  }
  void _abrirContato(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TelaContato()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ATM Consultoria"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 128, bottom: 16),
              child: Image.asset("images/logo.png"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: _abrirEmpresa,
                  child:  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Image.asset("images/menu_empresa.png"),
                  ),
                ),
                GestureDetector(
                  onTap: _abrirServico,
                  child:  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Image.asset("images/menu_servico.png"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: _abrirCliente,
                  child:  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Image.asset("images/menu_cliente.png"),
                  ),
                ),
                GestureDetector(
                  onTap: _abrirContato,
                  child:  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Image.asset("images/menu_contato.png"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

