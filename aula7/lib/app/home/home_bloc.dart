import 'package:aula7/app/home/home_event.dart';
import 'package:aula7/app/home/home_state.dart';

import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc {
  final repository;
  HomeBloc({@required this.repository}) {
    streamOut = _count.stream;
    _streamIn = _count.sink;
  }

  final _count = BehaviorSubject<HomeState>.seeded(None());
  Sink<HomeState> _streamIn;
  Stream<HomeState> streamOut;

  Future<void> _getProducts() async {
    _streamIn.add(Loading());
    try {
      final response = await repository.getProducts();
      _streamIn.add(Success(products: response));
      return;
    } catch (e) {
      print(e);
      _streamIn.add(Error(message: "Não foi possível buscar os produtos"));
    }
  }

  Future<void> _deleteProduct() {
    print("DELETADO");
  }

  void _mapToEvent(HomeEvent event) {
    if (event is GetProducts) {
      _getProducts();
    } else if (event is DeleteProduct) {
      _deleteProduct();
    }
  }

  void update(HomeEvent event) {
    _mapToEvent(event);
  }

  void dispose() {
    _count.close();
    _streamIn.close();
  }
}
