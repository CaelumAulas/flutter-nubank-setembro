import 'package:flutter/material.dart';

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
