import 'package:aula1/main.dart';
import 'package:flutter/material.dart';

import 'widgets/add_button.dart';
import 'widgets/list_object_widget.dart';

//TODO
//1-Componente para o Card - OK
//2-Componente de lista -OK
//3- O increment vai alterar uma variavel -OK

class HomePage extends StatelessWidget {
  HomePage({
    Key key,
  }) : super(key: key);
  final listKey = GlobalKey<ListObjectWidgetState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Flutter Demo Home Page"),
        actions: [
          IconButton(
              icon: Icon(Icons.swap_vertical_circle),
              onPressed: () {
                appKey.currentState.changeTheme();
              })
        ],
      ),
      body: ListObjectWidget(
        key: listKey,
      ),
      floatingActionButton: AddButton(
        onPressed: () {
          listKey.currentState.add();
        },
      ),
    );
  }
}
