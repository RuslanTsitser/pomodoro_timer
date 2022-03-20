import 'package:flutter/material.dart';

final kTheme = ThemeData(
    fontFamily: 'Montserrat',
    colorScheme: const ColorScheme(
      background: Color.fromRGBO(255, 252, 175, 1),
      brightness: Brightness.light,
      error: Colors.red,
      onBackground: Color.fromRGBO(31, 85, 62, 1),
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Color.fromRGBO(31, 85, 62, 1),
      primary: Color.fromRGBO(118, 216, 155, 1),
      secondary: Color.fromRGBO(63, 172, 156, 1),
      surface: Color.fromRGBO(255, 252, 175, 1),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: const Color.fromRGBO(31, 85, 62, 1),
        backgroundColor: const Color.fromRGBO(255, 252, 175, 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.all(
          16,
        ),
        textStyle: const TextStyle(
          fontFamily: 'Comfortaa',
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    ));
