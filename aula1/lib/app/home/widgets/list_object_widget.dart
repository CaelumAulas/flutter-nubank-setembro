import 'package:aula1/app/home/widgets/card.dart';
import 'package:flutter/material.dart';

class ListObjectWidget extends StatefulWidget {
  ListObjectWidget({Key key}) : super(key: key);

  @override
  ListObjectWidgetState createState() => ListObjectWidgetState();
}

class ListObjectWidgetState extends State<ListObjectWidget> {
  var _list = <int>[];
  void add() {
    _list.add(_list.length + 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _list
          .map((e) => CardWidget(
                value: e,
              ))
          .toList(),
    );
  }
}
