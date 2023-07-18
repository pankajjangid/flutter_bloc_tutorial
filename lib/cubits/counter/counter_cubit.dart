import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void updateCounter(int incrementSize) {
    emit(state.copyWith(counter: state.counter + incrementSize));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
