import 'package:aula7/app/home/home_bloc.dart';
import 'package:aula7/app/home/home_event.dart';
import 'package:aula7/app/home/home_state.dart';
import 'package:aula7/app/home/repositories/home_repository.dart';
import 'package:aula7/shared/models/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  HomeBloc bloc;
  HomeRepository repository = MockHomeRepository();
  setUp(() {
    bloc = HomeBloc(repository: repository);
  });

  group("Home Repository", () {
    test("When success", () async {
      final states = <HomeState>[];
      when(repository.getProducts()).thenAnswer(
          (_) => Future.value([Product(name: "name", id: "id", price: 100)]));
      bloc.streamOut.listen(
        (event) {
          states.add(event);
        },
      );
      bloc.update(GetProducts());
      await Future.delayed(Duration(milliseconds: 0));
      expect(states, isInstanceOf<List<HomeState>>());
      expect(states.length, 3);
      expect(states.last, isInstanceOf<Success>());
    });

    test("When error", () async {
      final states = <HomeState>[];
      when(repository.getProducts()).thenThrow("Deu error");
      bloc.streamOut.listen(
        (event) {
          states.add(event);
        },
      );
      bloc.update(GetProducts());
      await Future.delayed(Duration(milliseconds: 0));
      expect(states, isInstanceOf<List<HomeState>>());
      expect(states.length, 3);
      expect(states.last, isInstanceOf<Error>());
    });
  });
}
