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
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                        'https://scontent.frao3-1.fna.fbcdn.net/v/t1.6435-9/241018069_2452835041526804_2143297338244589728_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=k8rNimWghzgAX_7zv6O&_nc_ht=scontent.frao3-1.fna&oh=d4fa5aa1139750e99414d45b42f0d50c&oe=617BC2D0'),
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
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                        'https://scontent.frao3-1.fna.fbcdn.net/v/t31.18172-8/17240001_1287960207965010_1786169039635844643_o.jpg?_nc_cat=107&ccb=1-5&_nc_sid=ad2b24&_nc_ohc=LR1bhxX5cn8AX_LYnzY&tn=iT8oamy478Nu0FXC&_nc_ht=scontent.frao3-1.fna&oh=bd62e3f78a158912e5fbae460a8e0a98&oe=617CEB4D'),
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
