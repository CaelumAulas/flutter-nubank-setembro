//TODO
//Input de conta
//Input de valor
//Crio uma transferencia

import 'package:aula3/app/home/models/transfer.dart';
import 'package:flutter/material.dart';

class CreateTransferController {
  final formKey = GlobalKey<FormState>();
  var conta;
  var valor;

  bool isValid() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void saveConta(String value) => conta = int.parse(value);
  void saveValor(double value) => valor = value;

  String validatorValor(double number) {
    if (number < 10.0) {
      return "Valor minímo R\$: 10,00";
    }
    return null;
  }

  String validatorConta(String value) =>
      value.isEmpty ? "Digite um valor" : null;

  Transfer getTransfer() => Transfer(conta, valor);
}
