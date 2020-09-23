import 'package:aula8/shared/models/product.dart';
import 'package:flutter/foundation.dart';

class HomeState {}

class Loading extends HomeState {}

class None extends HomeState {}

class Error extends HomeState {
  final String message;
  final dynamic error;

  Error({@required this.message, this.error});
}

class Success extends HomeState {
  final List<Product> products;

  Success({@required this.products});
}
