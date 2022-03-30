import 'package:flutter/material.dart';


class TelaEmpresa extends StatefulWidget {
  String valor= "";
  TelaEmpresa(String valor){
    this.valor = valor;
  }
  @override
  State<TelaEmpresa> createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Empresa"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset("images/detalhe_empresa.png"),
                  Text(
                      "Sobre a empresa",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange
                    ),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 32),
                child: Text(
                    "nome: "+widget.valor,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 22
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
