import 'package:flutter/material.dart';

const swatch = Colors.cyan;
final accent = Colors.cyanAccent.shade700;
final primary = Colors.cyan.shade800;

const lightBg = Color.fromRGBO(233, 235, 238, 255); // #e9ebee
const darkBg = Color.fromRGBO(60, 63, 65, 255); // #3c3f41

/// List of available themes
enum Themes {
  LIGHT,
  DARK,
}

/// List of themes' data
final Map<Themes, ThemeData> ThemesData = {
  Themes.LIGHT: ThemeData(
    primarySwatch: swatch,
    primaryColor: primary,
    accentColor: accent,
    backgroundColor: lightBg,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  Themes.DARK: ThemeData(
    primarySwatch: swatch,
    primaryColor: primary,
    accentColor: accent,
    backgroundColor: darkBg,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
};

final defaultTheme = ThemesData[Themes.DARK];
