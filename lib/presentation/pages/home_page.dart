import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pomodoro_timer/presentation/widgets/app_drawer.dart';
import 'package:pomodoro_timer/presentation/widgets/menu_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: const MenuButton(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(118, 216, 155, 1),
              Color.fromRGBO(63, 172, 156, 1),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/pictures/pomodoro_big.png',
                width: double.maxFinite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
