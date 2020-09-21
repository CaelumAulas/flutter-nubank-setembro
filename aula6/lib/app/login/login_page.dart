import 'package:aula6/shared/utils/app_navigator.dart';
import 'package:flutter/material.dart';

import 'login_controller.dart';

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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = LoginController();

  void error() {
    scaffoldKey.currentState.showBottomSheet((context) => BottomSheet(
        onClosing: () {},
        builder: (_) => Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Center(
                  child: Text(
                "Email e/ou senha inválidos",
                style: TextStyle(fontSize: 20),
              )),
            )));
  }

  void success() {
    AppNavigator.to
        .pushReplacementNamed("/home", arguments: {"email": controller.email});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  validator: controller.validatorEmail,
                  onSaved: controller.saveEmail,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Senha"),
                  validator: controller.validatorPassword,
                  onSaved: controller.savePassword,
                ),
                SizedBox(
                  height: 16,
                ),
                // Text(key: errorLabelKey),
                RaisedButton(
                    color: Colors.orange,
                    child: Text("Entrar"),
                    onPressed: () {
                      controller.submit(error, success);
                    })
              ],
            )),
      ),
    );
  }
}
