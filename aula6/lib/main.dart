import 'package:aula6/app/shopping/shopping_page.dart';
import 'package:flutter/material.dart';

import 'app/home/home_page.dart';
import 'app/login/login_page.dart';
import 'app/splash/splash_page.dart';
import 'shared/utils/app_navigator.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        // "/": (context) => SplashPage(),
        "/": (context) => HomePage(),
        "/shopping": (context) => ShoppingPage()
      },
    );
  }
}
