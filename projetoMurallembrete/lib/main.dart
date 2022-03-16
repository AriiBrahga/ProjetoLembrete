import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:projeto_murallembrete/ajuda.dart';
import 'package:projeto_murallembrete/config.dart';
import 'package:projeto_murallembrete/sobre.dart';
import 'package:projeto_murallembrete/telaprincipal/telaprincipal.dart';
import 'telalembrete/lembrete.dart';
import 'login.dart';
import 'registro.dart';
import 'ajuda.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple[80],
      ),
      debugShowCheckedModeBanner: false,
      title: 'Mural',
      initialRoute: 'login',
      routes: {
        'login': (context) => Login(),
        'registro': (context) => Registro(),
        'sobre': (context) => Sobre(),
        'telaPrincipal': (context) => HomePage(),
        'telaLembrete': (context) => Lembretes(''),
        'telaAjuda': (context) => Ajuda(),
        'telaconfig': (context) => Configuracoes(),
      },
    ),
  );
}
