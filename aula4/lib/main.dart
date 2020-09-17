import 'package:flutter/material.dart';

//TODO
//Foco no setState;

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    print("BUILD APP");
    return MaterialApp(
      home: HomePage(
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final VoidCallback onPressed;
  const HomePage({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Criar um selecionador de itens da lista
  // O desafio eh trocar a cor quando o item for selecionado;
  final scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    print("BUILD HOME PAGE");
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: ListView(
        children: List.generate(
            10,
            (index) => ListTile(
                  title: Text("Index $index"),
                )),
      ),
    );
  }
}

class ClickButton extends StatefulWidget {
  final VoidCallback onPressed;
  const ClickButton({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  _ClickButtonState createState() => _ClickButtonState();
}

class _ClickButtonState extends State<ClickButton> {
  var clicked = false;
  @override
  Widget build(BuildContext context) {
    print("BUILD CLICK BUTTON");
    return FlatButton(
        color: clicked ? Colors.green : Colors.white,
        onPressed: () {
          clicked = !clicked;
          setState(() {});
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("Evento recebido")));
        },
        child: Text("Click"));
  }
}
