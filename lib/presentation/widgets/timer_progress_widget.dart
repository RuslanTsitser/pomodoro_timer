import 'package:flutter/material.dart';

class TimerProgressWidget extends StatelessWidget {
  const TimerProgressWidget({
    Key? key,
    this.wholeWidth = 254.0,
    required this.percentage,
  }) : super(key: key);
  final double percentage;
  final double wholeWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: wholeWidth,
        height: 14,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: wholeWidth * percentage / 100,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 175, 100, 1),
                      Color.fromRGBO(255, 255, 255, 1),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
