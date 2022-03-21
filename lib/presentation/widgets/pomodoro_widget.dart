import 'package:flutter/material.dart';

class PomodoroWidget extends StatelessWidget {
  const PomodoroWidget({
    Key? key,
    required this.pomodoroNumber,
    required this.percentage,
  }) : super(key: key);
  final int pomodoroNumber;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    double _currentPomodoroNumber = pomodoroNumber * percentage / 100;
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 40,
      width: pomodoroNumber * 60,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 20,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: pomodoroNumber,
        itemBuilder: (context, index) {
          if (index >= _currentPomodoroNumber) {
            return Image.asset(
              'assets/icons/pomodoro_empty.png',
              width: 40,
              height: 40,
            );
          }
          if (index + 0.5 >= _currentPomodoroNumber) {
            return Image.asset(
              'assets/icons/pomodoro_15.png',
              width: 40,
              height: 40,
            );
          }

          return Image.asset(
            'assets/icons/pomodoro.png',
            width: 40,
            height: 40,
          );
        },
      ),
    );
  }
}
