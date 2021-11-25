import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = TextEditingController();
  var senha = TextEditingController();
  var usuario = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 30),
              Center(
                child: Image(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 2.8,
                  image: AssetImage('images/New_oficial.png'), //////////////////////// 
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30),
              
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Email',
                    prefixIcon: Icon(
                      Icons.account_box,
                      size: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: TextField(
                  controller: senha,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Senha',
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 30,
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLoading = true;
                  });
                  login(email.text, senha.text);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 90),
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Esqueceu a senha?',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'registro');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.deepPurple[800],
                      height: 80,
                      child: Text(
                        'Não possui uma conta? Cadastre-se aqui',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      Navigator.pushReplacementNamed(context, 'telaPrincipal');
    }).catchError((erro) {
      if (erro.code == 'user-not-found') {
        exibirMensagem('ERRO: Usuario não encontrado.');
      } else if (erro.code == 'wrong-password') {
        exibirMensagem('ERRO: Senha Incorreta.');
      } else if (erro.code == 'invalid-email') {
        exibirMensagem('ERRO: Email Inválido.');
      } else {
        exibirMensagem('ERRO: ${erro.message}.');
      }
    });
  }

  void exibirMensagem(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
