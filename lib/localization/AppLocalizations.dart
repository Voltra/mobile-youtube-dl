import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Localization support for the app
class AppLocalizations {
  final Locale _locale;
  Map<String, String> _localized = {};

  AppLocalizations(this._locale);

  /// Get the localizations object from the build context
  factory AppLocalizations.of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  static String _translationPath(String languageCode) =>
      "translations/$languageCode.json";

  /// The list of supported locales
  static const locales = [
    Locale("en", "US"),
    // Locale("fr", "FR"),
  ];

  /// The localizations delegate
  static const delegate = _AppLocalizationDelegate();

  static const delegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  /// The callback for locale resolution
  static get localeResolutionCallback => (
        Locale deviceLocale,
        Iterable<Locale> supportedLocales,
      ) {
        if (supportedLocales.contains(deviceLocale)) {
          return deviceLocale;
        }

        return supportedLocales.contains(deviceLocale)
            ? deviceLocale
            : supportedLocales.first;
      };

  Future _populate() async {
    final raw =
        await rootBundle.loadString(_translationPath(_locale.languageCode));
    Map<String, dynamic> jsonData = json.decode(raw);
    _localized = jsonData.map((key, value) => MapEntry(key, value.toString()));
  }

  /// Get a translated string
  ///
  /// [key] is the translation key for the desired string
  String t(String key) => _localized[key];

  /// Overload for the function call operator (alias of [t(String)])
  String call(String key) => t(key);

  /// Overload for the array access operator (alias of [t(String)])
  String operator [](String key) => t(key);
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.locales.contains(locale);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localization = AppLocalizations(locale);
    await localization._populate();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
