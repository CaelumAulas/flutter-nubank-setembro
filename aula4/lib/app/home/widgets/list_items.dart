import 'package:aula4/app/home/models/item.dart';
import 'package:flutter/material.dart';

import 'clicked_list_tile_statefull.dart';

class ListItems extends StatefulWidget {
  final List<Item> items;
  final ValueChanged<bool> onChanged;

  const ListItems({
    Key key,
    @required this.items,
    this.onChanged,
  }) : super(key: key);

  @override
  ListItemsState createState() => ListItemsState();
}

class ListItemsState extends State<ListItems> {
  void render() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: widget.items
            .map((e) => ClickedListTile(
                  key: Key("index_${e.title}"),
                  title: e.title,
                  onPressed: (clicked) {
                    e.selected = clicked;
                    widget.onChanged(clicked);
                  },
                ))
            .toList(),
      ),
    );
  }
}
