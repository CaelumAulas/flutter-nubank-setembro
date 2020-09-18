import 'package:aula5/app/home/home_page.dart';
import 'package:aula5/main.dart';
import 'package:flutter/material.dart';

//TODO
//Desafio1
//-Criar as validacoes do form
//-Armazenar o email e senha em uma variavel ou objeto
//- Validar se o email e senha digitados sao autorizados

//email= email@email.com
//senha= 123456

///Desafio 2
//Nao autorizado exibir uma mensagem de error?

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Senha"),
            ),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
                color: Colors.orange,
                child: Text("Entrar"),
                onPressed: () {
                  AppNavigator.to.pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                })
          ],
        )),
      ),
    );
  }
}
