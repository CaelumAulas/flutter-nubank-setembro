import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';
import 'repositories/home_repository.dart';

/// Events -> States
class HomeFlutterBloc extends Bloc<HomeEvent, HomeState> {
  HomeFlutterBloc() : super(None());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {}
}

///Functions -> States
class HomeBloc extends Cubit<HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(None());

  Future<void> getProducts() async {
    emit(Loading());
    try {
      final response = await repository.getProducts();
      emit(Success(products: response));
    } catch (e) {
      emit(Error(message: "Nao foi possivel buscar os produtos"));
    }
  }
}
