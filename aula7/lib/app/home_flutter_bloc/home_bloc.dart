import 'package:aula7/app/home/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc({this.repository}) : super(None());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) {
    switch (event.runtimeType) {
      case GetProducts:
        return _getProducts();
        break;
      case DeleteProduct:
        return _deleteProduct();
        break;
      default:
        throw "NOT IMPLEMETED";
    }
  }

  Stream<HomeState> _getProducts() async* {
    yield Loading();
    try {
      final response = await repository.getProducts();
      yield Success(products: response);
      return;
    } catch (e) {
      print(e);
      yield Error(message: "Não foi possível buscar os produtos");
    }
  }

  Stream<HomeState> _deleteProduct() async* {
    yield Success(products: null);
  }
}
