import 'package:aula2/app/create_transfer/create_transfer.dart';
import 'package:flutter/material.dart';

//CreateTransfer
//HomePage
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("BUILD HOME");
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateTransfer()));
          },
          child: Text(
            "Navegar para Formulario",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
