import 'package:flutter/material.dart';

class TimerCounterWidget extends StatelessWidget {
  const TimerCounterWidget({
    Key? key,
    this.initialValue = 120,
  }) : super(key: key);
  final int initialValue;

  @override
  Widget build(BuildContext context) {
    Duration time = Duration(seconds: initialValue);
    int minutes = time.inMinutes;
    int seconds = time.inSeconds - time.inMinutes * 60;

    return Text(
      seconds < 10 ? '$minutes:0$seconds' : '$minutes:$seconds',
      style: const TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    );
  }
}
