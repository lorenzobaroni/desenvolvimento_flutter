import 'package:flutter/material.dart';

final lightTheme = ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Colors.white),
  ),
);

final darkTheme =  ThemeData.dark(
  useMaterial3: false,
).copyWith(appBarTheme: AppBarTheme(
  backgroundColor: Colors.deepPurple,
  foregroundColor: Colors.white,
),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.white,
  ),
);