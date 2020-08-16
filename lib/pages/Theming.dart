import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtubedl/themes/themes.dart';
import '../localization/AppLocalizations.dart';
import '../blocs/theme/bloc.dart';
import '../blocs/theme/state.dart';
import '../blocs/theme/event.dart';

class Theming extends StatelessWidget {
  String selectedTheme = null;

  Theming({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final i18n = AppLocalizations.of(context);
    final bloc = BlocProvider.of<ThemeBloc>(context);
    final items = AppTheme.mapping.values
        .map(
          (value) => DropdownMenuItem(
            value: value,
            child: Text(value.name.toLowerCase()),
          ),
        )
        .toList();

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        return Container(
          child: Column(
            children: [
              DropdownButton(
                items: items,
                onChanged: (AppTheme theme) {
                  selectedTheme = theme.name;
                  bloc.add(ThemeEvent.changeTheme(cardinal: theme.name));
                },
              ),
              BackButton(
                onPressed: () {
                  if (selectedTheme != null)
                    bloc.add(ThemeEvent.saveTheme(cardinal: selectedTheme));
                  ExtendedNavigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
