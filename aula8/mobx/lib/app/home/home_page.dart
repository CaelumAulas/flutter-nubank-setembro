import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'home_controller.dart';
import '../../shared/models/product.dart';
import './home_state.dart';
import './home_event.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
          child: Observer(builder: (_) {
            if (controller.state is Success) {
              final products = (controller.state as Success).products;
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(products[index].name),
                      ));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.update(GetProducts());
          },
        ));
  }
}
