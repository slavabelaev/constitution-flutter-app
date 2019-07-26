import 'package:flutter/material.dart';

class SettingsModel with ChangeNotifier {
  Locale locale;
  bool isDarkThemeEnabled = false;

  void switchLocale(Locale newLocale) {
    locale = newLocale;
    notifyListeners();
  }

  bool toggleDarkTheme(bool enabled) {
    this.isDarkThemeEnabled = enabled;
    notifyListeners();
    return enabled;
  }
}