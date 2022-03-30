import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  const TelaServico({Key? key}) : super(key: key);

  @override
  State<TelaServico> createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Serviço"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("images/detalhe_servico.png"),
                    Text(
                      "Nossos serviços",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Text(
                    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of "
                        "classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock,"
                        " a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure"
                        " Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the "
                        "word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from"
                        " sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil)"
                        " by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very "
                        "popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet..,"
                        " comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500"
                        "s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from"
                        "de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form,"
                        " accompanied by English versions from the 1914 translation by H. Rackham.",
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
