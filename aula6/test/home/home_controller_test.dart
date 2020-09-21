import 'package:aula6/app/home/home_controller.dart';
import 'package:aula6/app/home/home_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  HomeController controller;
  setUp(() {
    controller = HomeController();
  });

  group("Home Controller", () {
    test("Start", () {
      controller.stateNotifier.value;
    });
  });
}
