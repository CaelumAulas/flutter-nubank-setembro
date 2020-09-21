import 'package:aula6/app/home/home_repository.dart';
import 'package:aula6/app/home/home_state.dart';
import 'package:aula6/shared/models/product.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final repository = HomeRepository();
  final stateNotifier = ValueNotifier<HomeState>(Loading());
  List<Product> get products => (stateNotifier.value as Success).products;

  void getProducts() async {
    stateNotifier.value = Loading();
    try {
      final response = await repository.getProducts();
      stateNotifier.value = Success(products: response);
    } catch (e) {
      print(e);
      stateNotifier.value =
          Error(message: "Não foi possível buscar os produtos");
    }
  }
}
