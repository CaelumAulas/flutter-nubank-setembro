import 'package:aula1/app/home/widgets/card.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  ListWidget({Key key}) : super(key: key);

  @override
  ListWidgetState createState() => ListWidgetState();
}

class ListWidgetState extends State<ListWidget> {
  var length = 0;
  void add() {
    length++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, index) => CardWidget(
              value: index,
            ));
  }
}
