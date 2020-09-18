import 'package:aula5/app/home/home_page.dart';
import 'package:aula5/main.dart';
import 'package:flutter/material.dart';

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
