import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({
    Key? key,
    required this.onPressed,
    this.started = false,
  }) : super(key: key);
  final void Function() onPressed;
  final bool started;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(181.0, 48.0),
      ),
      child: Text(started ? 'STOP' : 'FOCUS'),
      onPressed: onPressed,
    );
  }
}
