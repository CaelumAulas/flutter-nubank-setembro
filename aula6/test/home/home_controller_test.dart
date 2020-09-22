import 'package:aula6/app/home/home_controller.dart';
import 'package:aula6/app/home/repositories/home_repository.dart';
import 'package:aula6/app/home/home_state.dart';
import 'package:aula6/shared/models/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  HomeRepository repository = MockHomeRepository();
  HomeController controller;
  setUp(() {
    controller = HomeController(repository: repository);
  });

  group("Home Controller", () {
    test("When success", () async {
      var states = <HomeState>[];

      when(repository.getProducts()).thenAnswer(
          (_) => Future.value([Product(name: "name", id: "id", price: 100)]));
      controller.stateNotifier.addListener(() {
        states.add(controller.stateNotifier.value);
      });
      await controller.getProducts();

      expect(states, isInstanceOf<List<HomeState>>());
      expect(states.length, 2);
      expect(states.last, isInstanceOf<Success>());
    });

    test("When error", () async {
      var states = <HomeState>[];

      when(repository.getProducts()).thenThrow("Deu error");
      controller.stateNotifier.addListener(() {
        states.add(controller.stateNotifier.value);
      });
      await controller.getProducts();

      expect(states, isInstanceOf<List<HomeState>>());
      expect(states.length, 2);
      expect(states.last, isInstanceOf<Error>());
    });
  });
}
