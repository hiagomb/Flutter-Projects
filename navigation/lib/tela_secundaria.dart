import 'package:flutter/material.dart';


class TelaSecundaria extends StatefulWidget {
  const TelaSecundaria({Key? key}) : super(key: key);

  @override
  State<TelaSecundaria> createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela secundária"),
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
