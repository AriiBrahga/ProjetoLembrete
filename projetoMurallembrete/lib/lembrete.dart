import 'package:flutter/material.dart';

import 'drawer.dart';


class Lembretes extends StatefulWidget {
  const Lembretes({Key? key}) : super(key: key);
  

  @override
  _LembretesState createState() => _LembretesState();
}


class _LembretesState extends State<Lembretes> {
  var tituloLembrete = TextEditingController();
  var descrLembrete = TextEditingController();
  var listaLembretes = [];
  var listadescr = [];
  
  
  
 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      //DRAWER

      drawer: CustomDrawer(),

      appBar: AppBar(
        backgroundColor: Colors.deepPurple[800],
        centerTitle: true,
        title: Text(
          'LEMBRETE', //AQUI VAMOS TRABALHAR COM DADOS, COLOCADOS NO NOME DO MURAL.
          style: TextStyle(
            letterSpacing: 7,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2.2 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: listaLembretes.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.amber[300],
              shadowColor: Colors.black,
              elevation: 10,
              child: ListTile(
                title: Text(
                  listaLembretes[index],
                  style: TextStyle(fontSize: 20),
                ),
                
                subtitle: Text(
                  listadescr[index],
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
                                    listaLembretes.removeAt(index);
                                    listadescr.removeAt(index);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Lembrete Removido com Sucesso'),
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
          },
        ),
      ),

      //ADICIONANDO LEMBRETES NO MURAL
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[800],
        child: Icon(Icons.add),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: Text(
                    'Adicionar Lembrete',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  //Controle da entrada de dados
                  content: Container(
                    height: 240,
                    child: Column(
                      children: [
                        TextField(
                          controller: tituloLembrete,
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 15.0),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.title,
                              size: 20,
                            ),
                            labelText: 'Titulo do lembrete',
                            labelStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        TextField(
                          controller: descrLembrete,
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 15.0),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.border_color_sharp,
                              size: 20,
                            ),
                            labelText: 'Descrição do lembrete',
                            labelStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        setState(() {
                          var msg = '';
                          if (tituloLembrete.text.isNotEmpty) {
                            listaLembretes.add(tituloLembrete.text);
                            listadescr.add(descrLembrete.text);

                            tituloLembrete.clear();
                            descrLembrete.clear();

                            msg = 'Lembrete adicionado com sucesso!';
                          } else {
                            msg = 'Erro: Adicione o titulo ao lembrete!!';
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(msg),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.pop(context);
                        });
                      },
                    ),
                    TextButton(
                      child: Text('Cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ]);
            },
          );
        },
      ),
    );
  }
}
