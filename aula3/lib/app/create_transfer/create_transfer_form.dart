import 'package:aula3/app/create_transfer/create_transfer_controller.dart';
import 'package:aula3/app/home/models/transfer.dart';
import 'package:flutter/material.dart';

import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'widgets/input_text_field.dart';

class CreateTransferForm extends StatefulWidget {
  final Function(Transfer transfer) onChange;
  CreateTransferForm({Key key, this.onChange}) : super(key: key);

  @override
  _CreateTransferFormState createState() => _CreateTransferFormState();
}

class _CreateTransferFormState extends State<CreateTransferForm> {
  var controller = CreateTransferController();
  final valorController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");

  @override
  Widget build(BuildContext context) {
    print("BUILD CREATE TRANSFER FORM");
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando transferência"),
        centerTitle: false,
      ),
      body: Form(
          key: controller.formKey,
          child: Column(
            children: [
              InputTextField(
                onSaved: controller.saveConta,
                validator: controller.validatorConta,
                hintText: "0000",
                labelText: "Número da conta",
                keyboardType: TextInputType.number,
              ),
              InputTextField(
                controller: valorController,
                labelText: "Valor",
                hintText: "0.00",
                onSaved: (_) =>
                    controller.saveValor(valorController.numberValue),
                validator: (_) =>
                    controller.validatorValor(valorController.numberValue),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                icon: Icon(
                  Icons.monetization_on,
                  size: 16,
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
                      if (controller.isValid()) {
                        widget.onChange(controller.getTransfer());
                        Navigator.pop(
                          context,
                        );
                      }
                    }),
              )
            ],
          )),
    );
  }
}
