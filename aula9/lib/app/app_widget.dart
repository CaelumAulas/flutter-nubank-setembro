import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      initialRoute: "/login",
      title: 'Flutter Modular',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
