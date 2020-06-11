import 'package:equatable/equatable.dart';

abstract class CountBlocEvent extends Equatable {
  const CountBlocEvent();
}

class IncreamentEvent extends CountBlocEvent {
  @override
  List<Object> get props {}
}

class DecrementEvent extends CountBlocEvent {
  @override
  List<Object> get props {}
}
