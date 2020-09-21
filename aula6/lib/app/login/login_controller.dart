import 'package:flutter/material.dart';

class LoginController {
  String email;
  String password;
  final formKey = GlobalKey<FormState>();

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

  void submit(VoidCallback error, VoidCallback success) {
    if (isValid()) {
      if (authorization()) {
        success();
      } else {
        error();
      }
    }
  }
}
