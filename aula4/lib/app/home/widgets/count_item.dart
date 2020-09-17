import 'package:flutter/material.dart';

class CountItem extends StatefulWidget {
  const CountItem({
    Key key,
  }) : super(key: key);

  @override
  CountItemState createState() => CountItemState();
}

class CountItemState extends State<CountItem> {
  var countItens = 0;

  void increment() {
    countItens++;
    setState(() {});
  }

  void decrement() {
    countItens--;
    setState(() {});
  }

  void reset() {
    countItens = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("COUNT ITEM");
    return Text("Itens selecionados: $countItens");
  }
}
