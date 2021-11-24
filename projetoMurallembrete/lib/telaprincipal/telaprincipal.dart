import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'mural.dart';
import '../drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  //Referenciar a coleção do Firestore
  late CollectionReference murais;

  @override
  void initState() {
    super.initState();

    murais = FirebaseFirestore.instance.collection('murais');
  }

  //
  // FORMATANDO OS ELEMENTOS LIST
  //

  exibirItemColecao(item) {
    String mural = item.data()['mural'];
    return Card(
      //
      //Formatando o Card
      //

      color: Colors.grey.shade300,
      shadowColor: Colors.black,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      //
      //Aqui é o comando pra mostrar os murais
      //

      child: ListTile(
        title: Text(
          mural,
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {
          Navigator.of(context)
              .pushReplacementNamed('telaLembrete', arguments: item.id);
        },
        trailing: IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: () {
            //Remover um item da lista
            setState(() {
              murais.doc(item.id).delete();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Mural Removido com Sucesso'),
                  duration: Duration(seconds: 2),
                ),
              );
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[800],
        centerTitle: true,
        title: Text(
          'MURAIS',
          style: TextStyle(
            letterSpacing: 7,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          

          stream: murais.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text('Não foi possível conectar ao Firestore'),
                );

              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              //se os dados foram recebidos com sucesso

              default:
                final dados = snapshot.requireData;

                return ListView.builder(
                  padding: EdgeInsets.all(30),
                  itemCount: dados.size,
                  itemBuilder: (context, index) {
                    SizedBox(height: 30);
                    return exibirItemColecao(dados.docs[index]);
                  },
                );
            }
          }),

      //ADICIONANDO MURAIS
      floatingActionButton: AdicionarMural(),
    );
  }
}
