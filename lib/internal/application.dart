import 'package:flutter/material.dart';
import 'package:pomodoro_timer/presentation/pages/home_page.dart';
import 'package:pomodoro_timer/presentation/theme/theme.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: kTheme,
      home: const HomePage(),
    );
  }
}
