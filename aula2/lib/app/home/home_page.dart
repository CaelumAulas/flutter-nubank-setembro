import 'package:aula2/app/create_transfer/create_transfer_form.dart';
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
          onPressed: () async {
            final transferencia = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateTransferForm()));
            print(transferencia);
            //TODO
            //Exibir a transferencia na tela de Home
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
