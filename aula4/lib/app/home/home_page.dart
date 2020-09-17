import 'package:flutter/material.dart';

import 'models/item.dart';

import 'widgets/count_item.dart';
import 'widgets/list_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Criar um selecionador de itens da lista
  // O desafio eh trocar a cor quando o item for selecionado;
  final items = List.generate(10, (index) => Item(false, "Index $index"));
  final countItemKey = GlobalKey<CountItemState>();
  final listItemKey = GlobalKey<ListItemsState>();
  @override
  Widget build(BuildContext context) {
    print("BUILD HOME PAGE");
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            items.removeWhere((element) => element.selected);
            countItemKey.currentState.reset();
            listItemKey.currentState.render();
          }),
      body: Column(
        children: [
          CountItem(
            key: countItemKey,
          ),
          ListItems(
            key: listItemKey,
            items: items,
            onChanged: (value) {
              if (value) {
                countItemKey.currentState.increment();
              } else {
                countItemKey.currentState.decrement();
              }
            },
          )
        ],
      ),
    );
  }
}
