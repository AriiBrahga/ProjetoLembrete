import 'package:flutter/material.dart';

import 'main.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('telaPrincipal');
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.deepPurple[800],
        centerTitle: true,
        title: Text(
          'SOBRE',
          style: TextStyle(
            letterSpacing: 7,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Center(
              child: Text(
                'MyWall',
                style: TextStyle(fontSize: 36, color: Colors.deepPurple[800]),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'MyWall é um aplicativo programado para facilitar o cotidiano das pessoas, funcionando como um mural, ou uma geladeira, para colocar lembretes, sendo eles extremamente importantes ou não, esse aplicativo foi pensado para que qualquer pessoa consiga utiliza-lo sem muita dificuldade, mesmo aquelas que não possuem facilidade com tecnologia.',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Divider(
              height: 40,
              color: Colors.black,
            ),
            Center(
              child: Text(
                'DEVs',
                style: TextStyle(fontSize: 36, color: Colors.deepPurple[800]),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3, 
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage('images/arielson.jpeg'),
                            fit: BoxFit.cover,
                        ),
                      ),
                ),
                Text(
                  'ARIELSON DA SILVA BRAGA',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'MATHEUS PRIETO PANO',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Container(
                  height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3, 
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage('images/pano.jpeg'),
                            fit: BoxFit.cover,
                        ),
                      ),
                  ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
