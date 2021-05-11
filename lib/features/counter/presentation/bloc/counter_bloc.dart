import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_template/core/usecases/usecase.dart';
import 'package:clean_architecture_template/features/counter/domain/usecases/get_counter_value_use_case.dart';
import 'package:clean_architecture_template/features/counter/domain/usecases/save_counter_value_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final GetCounterValueUseCase _getCounterUseCase;
  final SaveCounterValueUseCase _saveCounterValueUseCase;

  CounterBloc(this._saveCounterValueUseCase, this._getCounterUseCase)
      : super(CounterInitialState());

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is FetchCounterEvent)
      yield* _mapFetchCounterEventToState(event);
    else if (event is IncrementCounterEvent)
      yield* _mapIncrementCounterEventToState(state);
    else if (event is DecrementCounterEvent)
      yield* _mapDecrementCounterEventToState(state);
  }

  Stream<CounterState> _mapFetchCounterEventToState(
      FetchCounterEvent event) async* {
    await Future.delayed(Duration(seconds: 3));
    final value = await _getCounterUseCase.call(NoParams());
    yield value.fold(
      (l) => CounterChangedState(0),
      (r) => CounterChangedState(r),
    );
  }

  Stream<CounterState> _mapIncrementCounterEventToState(
      CounterState state) async* {
    if (state is CounterChangedState) {
      final value = state.value + 1;
      final result = await _saveCounterValueUseCase.call(value);
      yield result.fold(
        (l) => CounterErrorState(CACHE_FAILURE_MESSAGE),
        (r) => CounterChangedState(value),
      );
    }
  }

  Stream<CounterState> _mapDecrementCounterEventToState(
      CounterState state) async* {
    if (state is CounterChangedState) {
      final value = state.value - 1;
      final result = await _saveCounterValueUseCase.call(value);
      yield result.fold(
        (l) => CounterErrorState(CACHE_FAILURE_MESSAGE),
        (r) => CounterChangedState(value),
      );
    }
  }
}
