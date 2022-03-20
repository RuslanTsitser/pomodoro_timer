import 'package:flutter/material.dart';

class PomodoroWidget extends StatefulWidget {
  const PomodoroWidget({
    Key? key,
    required this.pomodoroNumber,
  }) : super(key: key);
  final int pomodoroNumber;

  @override
  State<PomodoroWidget> createState() => _PomodoroWidgetState();
}

class _PomodoroWidgetState extends State<PomodoroWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.white,
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: widget.pomodoroNumber,
      itemBuilder: (context, index) {
        return Image.asset(
          'assets/icons/pomodoro.png',
          width: 40,
        );
      },
    );
  }
}
