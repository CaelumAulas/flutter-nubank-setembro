import 'package:aula4/app/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Home Page", () {
    testWidgets("Home Page - Start", (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),
      ));
    });
  });
}
