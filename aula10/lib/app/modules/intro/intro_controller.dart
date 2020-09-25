import 'package:flutter/material.dart';

class IntroController {
  final pageController = PageController();
  var current = ValueNotifier<int>(0);

  IntroController() {
    pageController.addListener(() {
      setPage(pageController.page.toInt());
    });
  }

  void setPage(int value) {
    current.value = value;
  }
}
