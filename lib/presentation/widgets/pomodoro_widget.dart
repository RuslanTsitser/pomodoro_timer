import 'package:flutter/material.dart';

class PomodoroWidget extends StatelessWidget {
  const PomodoroWidget({
    Key? key,
    required this.pomodoroNumber,
  }) : super(key: key);
  final int pomodoroNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: pomodoroNumber * 60,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 20,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: pomodoroNumber,
        itemBuilder: (context, index) {
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
