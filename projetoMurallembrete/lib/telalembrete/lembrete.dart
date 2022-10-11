import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_murallembrete/telalembrete/addlembrete.dart';
import '../drawer.dart';
import 'lembrete.dart';

class Lembretes extends StatefulWidget {
  final String muralId;
  const Lembretes(this.muralId, {Key? key}) : super(key: key);

  @override
  _LembretesState createState() => _LembretesState();
}

class _LembretesState extends State<Lembretes> {
  var lembretes;
  var titleMural;
  @override
  void initState() {
    super.initState();

    lembretes = FirebaseFirestore.instance.collection('lembretes').where('mural', isEqualTo: widget.muralId);
    
    
    

  }


  //
  // FORMATANDO OS ELEMENTOS LIST
  //

  exibirLembretes(item) {
    String titulo = item.data()['Titulo'];
    String desc = item.data()['Descricao'];
    
    
    
    
    
    return Container(
          decoration: BoxDecoration(
            color: Colors.amber[300],
            boxShadow: [
            BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(-2, 2), // changes position of shadow
      ),
    ],
  ),
          
          child: ListTile(
            title: Text(
              titulo, 
              style: TextStyle(fontSize: 20),
            ), 
      
            subtitle:
            Text(
              desc,
              style: TextStyle(fontSize: 15),
            ),
            onLongPress: () async {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Remover Lembrete?',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        TextButton(
                            child: Text('Sim'),
                            onPressed: () {
                              
                              setState(() {
                                FirebaseFirestore.instance
                                  .collection('lembretes')
                                  .doc(item.id)
                                  .delete();
      
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Lembrete Removido com Sucesso'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                Navigator.pop(context);
                              });
                            }),
                        TextButton(
                            child: Text('Não'),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ],
                    );
                  });
            },
            
          ),
        );
        
      
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //DRAWER

      drawer: CustomDrawer(),

      appBar: AppBar(
        backgroundColor: Colors.deepPurple[800],
        centerTitle: true,
        title: Text(
          'LEMBRETES' ,  //AQUI VAMOS TRABALHAR COM DADOS, COLOCADOS NO NOME DO MURAL.
          style: TextStyle(
            letterSpacing: 7,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          

          stream: lembretes.snapshots(),
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

                return Scaffold(
                  body: Container(
                    padding: EdgeInsets.all(20),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          childAspectRatio: 2.2 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: dados.size,
                      itemBuilder: (context, index) {
                        SizedBox(height: 30);
                        return exibirLembretes(dados.docs[index]);
                      },
                    ),
                  ),
                );
            }
          }),

      //ADICIONANDO LEMBRETES NO MURAL

      floatingActionButton: AddLembrete(widget.muralId),
    );
  }
}


class FirebaseDatabase {
  static collection(String s) {}
}
