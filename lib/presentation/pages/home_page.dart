import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_timer/domain/model/ticker.dart';
import 'package:pomodoro_timer/domain/state/timer/timer_bloc.dart';
import 'package:pomodoro_timer/presentation/widgets/app_drawer.dart';
import 'package:pomodoro_timer/presentation/widgets/menu_button.dart';
import 'package:pomodoro_timer/presentation/widgets/percentage_widget.dart';
import 'package:pomodoro_timer/presentation/widgets/pomodoro_widget.dart';
import 'package:pomodoro_timer/presentation/widgets/timer_button.dart';
import 'package:pomodoro_timer/presentation/widgets/timer_counter_widget.dart';
import 'package:pomodoro_timer/presentation/widgets/timer_progress_widget.dart';
import 'package:pomodoro_timer/presentation/widgets/timer_setter_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerBloc>(
      create: (context) => TimerBloc(ticker: const Ticker()),
      child: BlocBuilder<TimerBloc, TimerState>(
        builder: (context, state) {
          return Scaffold(
            drawer: const AppDrawer(),
            body: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset('assets/pictures/Home.png'),
                  // child:
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 130.0),
                    child: TimerCounterWidget(initialValue: state.duration),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 402.0, right: 21),
                    child: TimerSetterWidget(
                      initValue: 1,
                      onChanged: (value) {
                        context.read<TimerBloc>().add(
                            TimerChanged(duration: value.toInt() * 30 * 60));
                      },
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                ),
                const Align(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 34.0),
                    child: MenuButton(),
                  ),
                  alignment: Alignment.bottomLeft,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: TimerButton(
                      started: state is TimerRunInProgress,
                      onPressed: () {
                        if (state is TimerRunInProgress) {
                          context.read<TimerBloc>().add(const TimerPaused());
                        } else if (state is TimerRunPause) {
                          context.read<TimerBloc>().add(const TimerResumed());
                        } else {
                          context
                              .read<TimerBloc>()
                              .add(TimerStarted(duration: state.duration));
                        }
                      },
                    ),
                  ),
                ),
                const Align(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 665.0),
                    child: TimerProgressWidget(
                      percentage: 50,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
                const Align(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 689.0),
                    child: PercentageWidget(
                      percentage: 50,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 292.0),
                    child: PomodoroWidget(
                      pomodoroNumber: state.duration ~/ (30 * 60),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
