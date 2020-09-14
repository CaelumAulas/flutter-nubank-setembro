import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final int value;

  const CardWidget({Key key, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Center(
      child: Text("$value"),
    ));
  }
}
