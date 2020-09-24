import 'package:meta/meta.dart';

@immutable
abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final Map<String, dynamic> data;

  SuccessHomeState({@required this.data});
}

class ErrorHomeState extends HomeState {
  final String message;
  ErrorHomeState({@required this.message});
}
