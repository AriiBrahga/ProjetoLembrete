import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdicionarMural extends StatefulWidget {
  const AdicionarMural({Key? key}) : super(key: key);

  @override
  _AdicionarMuralState createState() => _AdicionarMuralState();
}
// Mudei algo extremamente importante
//aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

class _AdicionarMuralState extends State<AdicionarMural> {
  var txtMural = TextEditingController();

  getDocumentById(id) async {
    await FirebaseFirestore.instance.collection('').doc(id).get().then((doc) {
      txtMural.text = doc.get('Mural');
    });
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (txtMural.text.isEmpty) {
        getDocumentById(id);
      }
    }

    return FloatingActionButton(
      backgroundColor: Colors.deepPurple[800],
      child: Icon(Icons.add),
      onPressed: () async {
        await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Adicionar Mural',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                content: TextField(
                  controller: txtMural,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.border_color_sharp,
                      size: 20.0,
                    ),
                    labelText: 'Nome do Mural',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      if (id == null) {
                        FirebaseFirestore.instance.collection('murais').add({
                          'mural': txtMural.text,
                          'id': FirebaseAuth.instance.currentUser!.uid,
                        });
                      } else {
                        //
                        // ATUALIZAR UM DOCUMENTO EXISTENTE
                        //
                        FirebaseFirestore.instance
                            .collection('murais')
                            .doc(id.toString())
                            .set({
                          'mural': txtMural.text,
                        });
                      }

                      setState(() {
                        var msg = '';
                        if (txtMural.text.isNotEmpty) {
                          txtMural.clear();

                          msg = 'Mural adicionado com sucesso!';
                        } else {
                          msg = 'Erro: Adicione o titulo ao mural!!';
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
                ],
              );
            });
      },
    );
  }
}
