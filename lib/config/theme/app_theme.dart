import 'package:flutter/material.dart';

const Color customColor = Color.fromARGB(255, 111, 165, 219);

const List<Color> _colorThemes = [
  Color(0xFF123456),
  Color(0xFF654321),
  Color(0xFFabcdef),
  Color(0xFFfedcba),
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
        'Colors must be between 0 and ${_colorThemes.length - 1}',
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.dark,
    );
  }
}
