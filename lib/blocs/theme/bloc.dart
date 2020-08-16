import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_enum/super_enum.dart';
import '../../themes/themes.dart';

import 'event.dart';
import 'state.dart';

@lazySingleton
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const KEY = "theme";

  ThemeBloc()
      : super(
          ThemeState.themeInitial(
            themeData: AppTheme.DEFAULT.themeData,
          ),
        );

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) /* async* */ {
    return event.when(
      loadTheme: _onLoadTheme,
      changeTheme: _onChangeTheme,
      saveTheme: _onSaveTheme,
    );
  }

  Future<SharedPreferences> _storage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  ThemeLoaded _fromCardinal(String cardinal) {
    final theme = AppTheme.getByName(cardinal);
    return ThemeState.themeLoaded(themeData: theme.themeData);
  }

  Stream<ThemeState> _onLoadTheme(LoadTheme e) async* {
    yield ThemeState.themeLoading(themeData: AppTheme.DEFAULT.themeData);
    final store = await _storage();
    final cardinal = store.getString(KEY);
    yield _fromCardinal(cardinal);
  }

  Stream<ThemeState> _onChangeTheme(ChangeTheme e) /* async* */ {
    return _onSaveTheme(SaveTheme(cardinal: e.cardinal));
  }

  Stream<ThemeState> _onSaveTheme(SaveTheme e) async* {
    yield ThemeState.themeLoading(
      themeData: AppTheme.getByName(e.cardinal).themeData,
    );
    final cardinal = e.cardinal;
    final store = await _storage();
    await store.setString(KEY, cardinal);
    yield _fromCardinal(cardinal);
  }
}
