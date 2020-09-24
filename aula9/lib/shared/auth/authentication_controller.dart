import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AutheticationController extends ChangeNotifier {
  bool logged = false;

  AutheticationController() {
    addListener(() {
      if (logged) {
        Modular.to.pushReplacementNamed("/login/home");
      } else {
        Modular.to.pushReplacementNamed("/login");
      }
    });
  }

  void login() {
    logged = true;
    notifyListeners();
  }

  void logout() {
    logged = false;
    notifyListeners();
  }
}
