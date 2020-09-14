import 'app/home/home_page.dart';
import 'package:flutter/material.dart';

//TODO
//BARRA DE STATUS - OK
//BARRA NO TOPO - AppBar - OK
//TEXTO CENTRALIZADO - OK
//NUMERO CENTRALIZADO - OK
//BOTAO DE MAIS - OK
final appKey = GlobalKey<AppState>();

void main() {
  runApp(App(
    key: appKey,
  ));
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  var isDark = false;

  void changeTheme() {
    isDark = !isDark;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: isDark ? ThemeData.dark() : ThemeData(primarySwatch: Colors.red),
        home: HomePage());
  }
}
