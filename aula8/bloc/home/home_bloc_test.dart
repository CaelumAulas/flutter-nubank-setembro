import 'package:aula8/app/home/home_bloc.dart';
import 'package:aula8/app/home/home_state.dart';
import 'package:aula8/app/home/repositories/home_repository.dart';
import 'package:aula8/shared/models/product.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  HomeBloc bloc;
  HomeRepository repository;
  setUp(() {
    repository = MockHomeRepository();
    bloc = HomeBloc(repository);
  });

  group("Home Bloc", () {
    blocTest("Get Products - success",
        build: () {
          when(repository.getProducts()).thenAnswer((_) =>
              Future.value([Product(id: "id", name: "name", price: 100)]));
          return bloc;
        },
        act: (HomeBloc c) async {
          await c.getProducts();
        },
        verify: (HomeBloc cubit) => cubit.state.runtimeType,
        expect: [isA<Loading>(), isA<Success>()]);

    blocTest(
      "Get Products - error",
      build: () {
        when(repository.getProducts()).thenThrow("Deu ruim");
        return bloc;
      },
      act: (HomeBloc c) async {
        await c.getProducts();
      },
      verify: (HomeBloc cubit) => cubit.state.runtimeType,
      expect: [isA<Loading>(), isA<Error>()],
    );
  });
}
