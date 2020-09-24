import 'dart:async';
import 'package:aula9_slidy/app/modules/home/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;
  HomeBloc({@required this.repository}) : super(InitialHomeState()) {
    add(HomeGetPost());
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeGetPost) {
      yield* _getPost();
    }
  }

  Stream<HomeState> _getPost() async* {
    yield LoadingHomeState();
    try {
      final response = await repository.fetchPost();
      yield SuccessHomeState(data: response);
    } catch (e) {
      yield ErrorHomeState(message: "Nao foi possivel buscar o post");
    }
  }
}
