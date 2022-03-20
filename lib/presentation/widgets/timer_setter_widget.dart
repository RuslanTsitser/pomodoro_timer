import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class TimerSetterWidget extends StatefulWidget {
  const TimerSetterWidget({
    Key? key,
    required this.onChanged,
    required this.initValue,
  }) : super(key: key);
  final void Function(double value) onChanged;
  final int initValue;

  @override
  State<TimerSetterWidget> createState() => _TimerSetterWidgetState();
}

class _TimerSetterWidgetState extends State<TimerSetterWidget> {
  late double _currentSliderValue;

  @override
  void initState() {
    _currentSliderValue = widget.initValue.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 160,
      child: SfSlider.vertical(
        thumbIcon: Image.asset(
          'assets/icons/thumb.png',
        ),
        value: _currentSliderValue,
        stepSize: 1,
        min: 0,
        max: 6,
        onChanged: (value) {
          setState(() {
            _currentSliderValue = value;
          });
          widget.onChanged(value);
        },
        activeColor: Theme.of(context).colorScheme.background,
        inactiveColor: Colors.white.withOpacity(0.44),
      ),
    );
  }
}
