import 'package:flutter/material.dart';

class PercentageWidget extends StatelessWidget {
  const PercentageWidget({Key? key, required this.percentage})
      : super(key: key);
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Completed ${percentage.round()}%',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
