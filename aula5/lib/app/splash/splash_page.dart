import 'dart:async';

import 'package:aula5/main.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final BuildContext context;
  SplashPage({Key key, this.context}) : super(key: key) {
    Future.delayed(Duration(seconds: 2))
        .then((value) => AppNavigator.to.pushReplacementNamed("/login"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Icon(
          Icons.ac_unit,
          size: 100,
        ),
      ),
    );
  }
}
