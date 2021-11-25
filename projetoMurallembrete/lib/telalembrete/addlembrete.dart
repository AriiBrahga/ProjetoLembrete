import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddLembrete extends StatefulWidget {
  final String muralId;

  const AddLembrete(this.muralId, {Key? key}) : super(key: key);

  @override
  _AddLembreteState createState() => _AddLembreteState();
}

class _AddLembreteState extends State<AddLembrete> {
  var txtTitulo = TextEditingController();
  var txtDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
                        controller: txtTitulo,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
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
                        controller: txtDescricao,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
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
                      FirebaseFirestore.instance.collection('lembretes').add({
                        'Titulo': txtTitulo.text,
                        'Descricao': txtDescricao.text,
                        'mural': widget.muralId,
                      });

                      setState(() {
                        var msg = '';
                        if (txtTitulo.text.isNotEmpty) {
                          txtTitulo.clear();
                          txtDescricao.clear();

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
                      setState(
                        () {
                          if (txtTitulo.text.isNotEmpty) {
                            txtTitulo.clear();
                            txtDescricao.clear();
                          }
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ]);
          },
        );
      },
    );
  }
}
