import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
      dialogBackgroundColor: Colors.white,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.blue.shade400,
        selectionColor: Colors.blue.withOpacity(0.4),
        selectionHandleColor: Colors.blueAccent,
      ),
    );
  }
}
