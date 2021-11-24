import 'package:flutter/material.dart';

import 'main.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({Key? key}) : super(key: key);

  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  bool isChecked = false;

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
          'CONFIGURAÇÕES',
          style: TextStyle(
            letterSpacing: 7,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
      body: Container(
        //padding: EdgeInsets.all(30),
        color: Colors.deepPurple[800],
        child: Center(
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              //Seria os Temas
              children: [
                Center(
                  child: Row(
                    children: [
                     SizedBox(height: 100,),
                      Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text('Receber Notificacões'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
