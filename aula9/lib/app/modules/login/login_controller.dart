import 'package:aula9/shared/auth/authentication_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginController extends Disposable {
  final AutheticationController auth;

  LoginController({@required this.auth});

  void login() {
    auth.login();
  }

  @override
  void dispose() {
    print("LoginController DISPOSED");
  }
}
