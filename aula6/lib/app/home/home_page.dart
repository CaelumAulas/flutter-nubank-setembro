import 'package:aula6/app/home/home_controller.dart';
import 'package:aula6/app/home/home_state.dart';
import 'package:aula6/app/shopping/shopping_controller.dart';
import 'package:aula6/shared/models/product.dart';
import 'package:aula6/shared/utils/app_navigator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getProducts();
    super.initState();
  }

  @override
  void dispose() {
    ShoppingController.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILDER");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [ShoppingWidget()],
      ),
      body: ValueListenableBuilder<HomeState>(
          valueListenable: controller.stateNotifier,
          builder: (context, state, _) {
            if (state is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Success) {
              final products = state.products;
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(products[index].name),
                        trailing: Text("${products[index].money}"),
                        onTap: () {
                          ShoppingController.instance.add(products[index]);
                        },
                      ));
            } else {
              final error = state as Error;
              return Center(child: Text(error.message));
            }
          }),
    );
  }
}

class ShoppingWidget extends StatefulWidget {
  const ShoppingWidget({
    Key key,
  }) : super(key: key);

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<ShoppingWidget> {
  final controller = ShoppingController.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: () {
            AppNavigator.to.pushNamed("/shopping");
          },
          child: CircleAvatar(
              child: ValueListenableBuilder(
                  valueListenable: controller.itemsNotifier,
                  builder: (context, items, _) =>
                      Text("${controller.amount}")))),
    );
  }
}
