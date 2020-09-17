import 'package:flutter/material.dart';

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
        setState(() {});
        widget.onPressed(clicked);
      },
    );
  }
}
