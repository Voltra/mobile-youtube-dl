import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:youtubedl/themes/themes.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
			theme: defaultTheme,
      supportedLocales: AppLocalizations.locales,
      localeResolutionCallback: AppLocalizations.localeResolutionCallback,
      localizationsDelegates: AppLocalizations.delegates,
      builder: ExtendedNavigator.builder(
        router: Router(),
        initialRoute: Routes.home,
        builder: (context, extendedNav) => Theme(
          data: defaultTheme,
          child: SafeArea(
            child: extendedNav,
          ),
        ),
      ),
    );
  }
}
