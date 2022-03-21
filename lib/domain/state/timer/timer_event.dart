part of 'timer_bloc.dart';

@immutable
abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class TimerStarted extends TimerEvent {
  const TimerStarted({
    required this.duration,
    required this.initDuration,
  });
  final int duration;
  final int initDuration;
}

class TimerPaused extends TimerEvent {
  const TimerPaused();
}

class TimerResumed extends TimerEvent {
  const TimerResumed();
}

class TimerChanged extends TimerEvent {
  const TimerChanged({required this.duration});
  final int duration;
  @override
  List<Object> get props => [duration];
}

class TimerTicked extends TimerEvent {
  const TimerTicked({
    required this.duration,
    required this.initDuration,
  });
  final int duration;
  final int initDuration;

  @override
  List<Object> get props => [duration];
}
