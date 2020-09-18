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
  String email;
  String password;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String validatorEmail(String email) {
    if (email == null || email.isEmpty || !email.contains('@')) {
      return "Email inválido";
    }
    return null;
  }

  String validatorPassword(String value) =>
      value.isEmpty ? "Digite um valor" : null;

  bool isValid() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  bool authorization() {
    if (email == 'email@email.com' && password == '123456') {
      return true;
    } else {
      return false;
    }
  }

  void saveEmail(String value) => email = value;
  void savePassword(String value) => password = value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  validator: validatorEmail,
                  onSaved: saveEmail,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Senha"),
                  validator: validatorPassword,
                  onSaved: savePassword,
                ),
                SizedBox(
                  height: 16,
                ),
                // Text(key: errorLabelKey),
                RaisedButton(
                    color: Colors.orange,
                    child: Text("Entrar"),
                    onPressed: () {
                      if (isValid()) {
                        print("$email:$password");
                        if (authorization()) {
                          AppNavigator.to.pushReplacement(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        } else {
                          scaffoldKey.currentState
                              .showBottomSheet((context) => BottomSheet(
                                  onClosing: () {},
                                  builder: (_) => Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
                                        child: Center(
                                            child: Text(
                                          "Email e/ou senha inválidos",
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      )));
                        }
                      }
                    })
              ],
            )),
      ),
    );
  }
}
