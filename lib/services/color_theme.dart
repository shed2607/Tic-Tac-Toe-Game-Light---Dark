// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get themeData {
    return ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.blueGrey.shade50,
          primary: Colors.blueGrey,
          secondary: Colors.black,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Colors.white, // Set app bar background color for light theme
          foregroundColor:
              Colors.black, // Set app bar text color for light theme
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ));
  }
}

class DarkTheme {
  static ThemeData get themeData {
    return ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.black38,
          primary: Colors.blueGrey.shade50,
          secondary: Colors.white,
        ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors
              .blueGrey.shade800, // Set app bar background color for dark theme
          foregroundColor:
              Colors.white, // Set app bar text color for dark theme
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.black,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ));
  }
}
