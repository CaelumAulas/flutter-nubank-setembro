import 'package:aula5/app/splash/splash_page.dart';
import 'package:aula5/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                AppNavigator.to.pushReplacement(
                    MaterialPageRoute(builder: (context) => SplashPage()));
              })
        ],
      ),
    );
  }
}
