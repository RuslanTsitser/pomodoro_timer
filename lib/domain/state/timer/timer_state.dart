part of 'timer_bloc.dart';

@immutable
abstract class TimerState extends Equatable {
  final int duration;
  final int initDuration;

  const TimerState(
    this.duration,
    this.initDuration,
  );

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial(
    int duration,
    int initDuration,
  ) : super(duration, initDuration);
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(
    int duration,
    int initDuration,
  ) : super(duration, initDuration);
}

class TimerRunPause extends TimerState {
  const TimerRunPause(
    int duration,
    int initDuration,
  ) : super(duration, initDuration);
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete(int initDuration) : super(0, initDuration);
}
