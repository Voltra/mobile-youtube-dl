import 'package:better_enum/better_enum.dart';
import 'package:flutter/material.dart';

const swatch = Colors.cyan;
final accent = Colors.cyanAccent.shade700;
final primary = Colors.cyan.shade800;

const lightBg = Color.fromRGBO(233, 235, 238, 255); // #e9ebee
const darkBg = Color.fromRGBO(60, 63, 65, 255); // #3c3f41

class AppTheme extends Enum<ThemeData> {
  final ThemeData themeData;
  final String name;

  AppTheme._(
    this.themeData, {
    @required this.name,
  }) : super(themeData, name);

  static final LIGHT = AppTheme._(
      ThemeData(
        primarySwatch: swatch,
        primaryColor: primary,
        accentColor: accent,
        backgroundColor: lightBg,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      "LIGHT");

  static final DARK = AppTheme._(
    ThemeData(
      primarySwatch: swatch,
      primaryColor: primary,
      accentColor: accent,
      backgroundColor: darkBg,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    "DARK",
  );

  static final DEFAULT = AppTheme.DARK;

  static final mapping = {
    "DARK": DARK,
    "LIGHT": LIGHT,
  };

  static AppTheme getByName(String name) {
    return mapping.containsKey(name) ? mapping[name] : DEFAULT;
  }
}
