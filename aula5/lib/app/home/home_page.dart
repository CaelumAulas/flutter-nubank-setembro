import 'package:aula5/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = (ModalRoute.of(context).settings.arguments as Map)['email'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                AppNavigator.to.pushReplacementNamed("/login");
              })
        ],
      ),
      body: Center(
        child: Text(email),
      ),
    );
  }
}
