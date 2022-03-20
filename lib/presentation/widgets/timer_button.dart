import 'package:flutter/material.dart';

class TimerButton extends StatefulWidget {
  const TimerButton({
    Key? key,
    required this.onPressed,
    this.started = false,
  }) : super(key: key);
  final void Function() onPressed;
  final bool started;

  @override
  State<TimerButton> createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  late bool started;

  @override
  void initState() {
    started = widget.started;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(181.0, 48.0),
      ),
      child: Text(started ? 'STOP' : 'FOCUS'),
      onPressed: () {
        if (started) {
          setState(() {
            started = false;
          });
        } else {
          setState(() {
            started = true;
          });
        }
        widget.onPressed();
      },
    );
  }
}
