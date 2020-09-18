import 'dart:async';

import 'package:aula5/app/login/login_page.dart';
import 'package:aula5/main.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final BuildContext context;
  SplashPage({Key key, this.context}) : super(key: key) {
    Timer(Duration(seconds: 2), () {
      AppNavigator.to.pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    });
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
