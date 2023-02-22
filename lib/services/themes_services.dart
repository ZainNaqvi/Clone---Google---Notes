import 'package:flutter/material.dart';

class Themes {
  // light theme
  static final light = ThemeData(
    backgroundColor: Colors.white,
    primarySwatch: Colors.blue,
    useMaterial3: true,
    brightness: Brightness.light,
  );
  // dark theme
  static final dark = ThemeData(
    backgroundColor: Colors.black.withOpacity(0.7),
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}
