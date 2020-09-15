import 'package:flutter/material.dart';

import 'package:flutter_masked_text/flutter_masked_text.dart';

class CreateTransferForm extends StatefulWidget {
  CreateTransferForm({Key key}) : super(key: key);

  @override
  _CreateTransferFormState createState() => _CreateTransferFormState();
}

class _CreateTransferFormState extends State<CreateTransferForm> {
  final formKey = GlobalKey<FormState>();
  final valorController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");
  String numeroDaConta;
  String valor;

  bool isValid() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando transferência"),
        centerTitle: false,
      ),
      body: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (newValue) => numeroDaConta = newValue,
                  validator: (value) =>
                      value.isEmpty ? "Digite o numero da conta" : null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Número da conta", hintText: "0000"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: valorController,
                  onSaved: (newValue) => valor = newValue,
                  validator: valorValidator,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.monetization_on,
                        size: 16,
                      ),
                      labelText: "Valor",
                      hintText: "0.00"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                    color: Color(0xFF2a62ff),
                    child: Text(
                      "Confirmar",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (isValid()) {
                        Navigator.pop(context,
                            {"numeroDaConta": numeroDaConta, "valor": valor});
                      }
                    }),
              )
            ],
          )),
    );
  }

  String valorValidator(_) {
    final number = valorController.numberValue;
    if (number < 10.0) {
      return "Valor minímo R\$: 10,00";
    }
    return null;
  }
}
