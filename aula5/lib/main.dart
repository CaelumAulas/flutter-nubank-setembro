import 'package:aula5/app/home/home_page.dart';
import 'package:aula5/app/login/login_page.dart';
import 'package:aula5/app/splash/splash_page.dart';
import 'package:flutter/material.dart';

///TODO - NAVEGACAO

///Primeiro Desafio
///1- Splash -> LOGIC?
///2- Login -> LOGIC - VALIDAR O LOGIN
///3- Home -> LOGIN? - Logout

void main() {
  runApp(App());
}

class AppNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final to = navigatorKey.currentState;
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      theme:
          ThemeData(primarySwatch: Colors.orange, primaryColor: Colors.orange),
      initialRoute: "/",
      routes: {
        "/": (context) => SplashPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage()
      },
    );
  }
}
