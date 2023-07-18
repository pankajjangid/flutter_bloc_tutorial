import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color/color_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
   int incrementSize=1;
   final ColorCubit colorCubit;
    late final StreamSubscription subscription;
  CounterCubit(this.colorCubit) : super(CounterState.initial()){
    subscription = colorCubit.stream.listen((ColorState colorState) {
      if(colorState.color == Colors.red){
        incrementSize=1;
      }
      else if(colorState.color == Colors.green){
        incrementSize=10;
      }
      else if(colorState.color == Colors.blue){
      incrementSize=100;
      }
      else if(colorState.color == Colors.black){
        emit(state.copyWith(counter: state.counter-100));
        incrementSize =-100;
      }
    });
  }

  void updateCounter(){
    emit(state.copyWith(counter: state.counter+incrementSize));
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
