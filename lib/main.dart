import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './blocs/theme/bloc.dart';
import './blocs/theme/state.dart';
import './themes/themes.dart';
import './di/injection.dart';
import './di/env.dart';
import './localization/AppLocalizations.dart';
import './routing/router.gr.dart';

const env = Env.dev;

void main() {
  configureInjection(env);
  runApp(YoutubeDlApp());
}

class YoutubeDlApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        provideBloc<ThemeBloc>(),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, ThemeState state) {
          return state.when(
            themeInitial: (e) => _buildApp(context, AppTheme.DEFAULT.themeData),
            themeLoaded: (ThemeLoaded e) => _buildApp(context, e.themeData),
            themeLoading: (_) => _loadingScreen(context),
          );
        },
      ),
    );
  }

  provideBloc<T extends Bloc>() {
    return BlocProvider<T>(create: (_) => DI.get<T>());
  }

  _buildApp(BuildContext context, ThemeData themeData) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      color: themeData.accentColor,
      supportedLocales: AppLocalizations.locales,
      localeResolutionCallback: AppLocalizations.localeResolutionCallback,
      localizationsDelegates: AppLocalizations.delegates,
      builder: ExtendedNavigator.builder(
        router: Router(),
        initialRoute: Routes.home,
        builder: (context, extendedNav) => Theme(
          data: themeData,
          child: SafeArea(
            child: extendedNav,
          ),
        ),
      ),
    );
  }

  _loadingScreen(BuildContext context) {
    return Container();
  }
}
