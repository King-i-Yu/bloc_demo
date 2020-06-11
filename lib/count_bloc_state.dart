import 'package:equatable/equatable.dart';

abstract class CountBlocState extends Equatable {
  const CountBlocState();
}

class InitialCountBlocState extends CountBlocState {
  @override
  List<Object> get props => [];
}
