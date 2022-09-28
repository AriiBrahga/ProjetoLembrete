import 'package:flutter/material.dart';


class Ajuda extends StatelessWidget {
  const Ajuda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed('telaPrincipal');
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.deepPurple[800],
        centerTitle: true,
        title: Text(
          'AJUDA',
          style: TextStyle(
            letterSpacing: 7,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
      body: Container(
        color: Colors.indigo[900],
        padding: EdgeInsets.all(30),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(50),
            height: 500,
            width: 350,
            color: Colors.white,
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Menu Ajuda',
                    style:
                        TextStyle(fontSize: 36, color: Colors.deepPurple[800]),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Bem-vindo ao Menu de Ajuda, atualmente não temos um material pronto para ajudar, mas qualquer duvidas podem ser sanadas ao contactar nosso Email: mywall@gmail.com',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
