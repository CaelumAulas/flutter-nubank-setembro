import 'package:flutter/material.dart';

//TODO
//Foco no setState;

class Item {
  bool selected;
  String title;

  Item(this.selected, this.title);
}

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
  // Criar um selecionador de itens da lista
  // O desafio eh trocar a cor quando o item for selecionado;
  final scaffoldKey = GlobalKey();
  final items = List.generate(10, (index) => Item(false, "Index $index"));
  var countItens = 0;
  @override
  Widget build(BuildContext context) {
    print("BUILD HOME PAGE");
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Itens selecionados: $countItens"),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: items
                  .map((e) => ClickedListTileStateless(
                        item: e,
                        onPressed: (clicked) {
                          e.selected = clicked;
                          if (clicked) {
                            countItens++;
                          } else {
                            countItens--;
                          }
                          setState(() {});
                        },
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class ClickedListTileStateless extends StatelessWidget {
  final Item item;
  final ValueChanged<bool> onPressed;
  const ClickedListTileStateless({Key key, this.item, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      leading: item.selected
          ? Icon(
              Icons.check_box,
              color: Colors.blue,
            )
          : Icon(Icons.check_box_outline_blank),
      onTap: () {
        onPressed(!item.selected);
      },
    );
  }
}

class ClickedListTile extends StatefulWidget {
  final String title;
  final ValueChanged<bool> onPressed;
  ClickedListTile({Key key, this.title, this.onPressed}) : super(key: key);

  @override
  _ClickedListTileState createState() => _ClickedListTileState();
}

class _ClickedListTileState extends State<ClickedListTile> {
  var clicked = false;
  @override
  Widget build(BuildContext context) {
    print("CLICKED LIST TILE");
    return ListTile(
      title: Text(widget.title),
      leading: clicked
          ? Icon(
              Icons.check_box,
              color: Colors.blue,
            )
          : Icon(Icons.check_box_outline_blank),
      onTap: () {
        clicked = !clicked;

        widget.onPressed(clicked);
      },
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
