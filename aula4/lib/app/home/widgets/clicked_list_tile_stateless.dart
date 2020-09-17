import 'package:aula4/app/home/models/item.dart';
import 'package:flutter/material.dart';

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
