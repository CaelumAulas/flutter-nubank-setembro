import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class HomeGetPost extends HomeEvent {
  @override
  List<Object> get props => [];
}
