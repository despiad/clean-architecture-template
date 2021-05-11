part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitialState extends CounterState {}

class CounterChangedState extends CounterState {
  final int value;

  CounterChangedState(this.value);
}

class CounterErrorState extends CounterState{
  final String message;

  CounterErrorState(this.message);
}