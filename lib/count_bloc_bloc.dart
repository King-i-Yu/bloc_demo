import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class CountBlocBloc extends Bloc<CountBlocEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(
    CountBlocEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is IncreamentEvent) {
      yield state + 1;
    } else if (event is DecrementEvent) {
      yield state - 1;
    }
  }
}
