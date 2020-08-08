import 'package:flutter/material.dart';

/// List of available themes
enum Themes {
  LIGHT,
  DARK,
}

/// List of themes' data
final Map<Themes, ThemeData> ThemesData = {
  Themes.LIGHT: ThemeData(
    primarySwatch: Colors.blue,
    accentColor: Colors.cyanAccent,
    backgroundColor: const Color.fromRGBO(233, 235, 238, 255), // #e9ebee
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  Themes.DARK: ThemeData(
    primarySwatch: Colors.cyan,
    accentColor: Colors.blueAccent.shade400,
    backgroundColor: const Color.fromRGBO(60, 63, 65, 255), // #3c3f41
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
};

final defaultTheme = ThemesData[Themes.DARK];
