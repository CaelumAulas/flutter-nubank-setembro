import 'package:aula6/app/shopping/shopping_controller.dart';
import 'package:flutter/material.dart';

class ShoppingPage extends StatefulWidget {
  ShoppingPage({Key key}) : super(key: key);

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final controller = ShoppingController.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Shopping Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: ValueListenableBuilder(
          valueListenable: controller.itemsNotifier,
          builder: (context, items, _) => ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(items[index].name),
                    trailing: Text("${items[index].money}"),
                    onTap: () {
                      controller.remove(index);
                    },
                  ))),
    );
  }
}
