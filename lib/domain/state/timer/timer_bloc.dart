import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pomodoro_timer/domain/model/ticker.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  static const int _duration = 1 * 30 * 60;

  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerTicked>(_onTicked);
    on<TimerChanged>(_onChanged);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(TimerRunInProgress(event.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(TimerTicked(duration: duration)));
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration));
    }
  }

  void _onResumed(TimerResumed resume, Emitter<TimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration));
    }
  }

  void _onChanged(TimerChanged change, Emitter<TimerState> emit) {
    if (state is TimerInitial) {
      emit(TimerInitial(change.duration));
    }
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          ? TimerRunInProgress(event.duration)
          : const TimerRunComplete(),
    );
  }
}
