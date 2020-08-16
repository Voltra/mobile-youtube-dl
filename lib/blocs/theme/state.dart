import 'package:flutter/material.dart';
import 'package:super_enum/super_enum.dart';

part 'state.g.dart';

const ThemingInfo = Data(
  fields: [
    DataField<ThemeData>("themeData"),
  ],
);

@superEnum
enum _ThemeState {
  @ThemingInfo
  ThemeInitial,

  @ThemingInfo
  ThemeLoading,

  @ThemingInfo
  ThemeLoaded,
}
