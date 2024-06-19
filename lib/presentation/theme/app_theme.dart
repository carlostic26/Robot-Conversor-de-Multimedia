import 'package:flutter/material.dart';

final ThemeData myAppThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color.fromARGB(255, 14, 14, 14),
  scaffoldBackgroundColor: Colors.grey[850],
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
    accentColor: Color.fromARGB(255, 6, 161, 84),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    headlineLarge: TextStyle(color: Colors.white),
    headlineMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.white70),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
