import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';

import '../lib/app/home/home_controller.dart';
import '../lib/app/home/home_state.dart';

void main() {
  HomeController controller;
  setUp(() {
    controller = HomeController();
  });

  test("GetProducts", () async {
    final expected = [isA<Loading>(), isA<Success>()];
    final matcher = <HomeState>[];
    final disposer =
        reaction((_) => controller.state, (value) => matcher.add(value));
    await controller.getProducts();
    print(matcher);
    print(expected);
    expect(matcher, expected);

    disposer();
  });
}
