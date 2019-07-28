import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsModel with ChangeNotifier {
  SettingsModel() {
    _loadSavedSettings();
  }

  bool loaded = false;
  Locale locale;
  bool isDarkThemeEnabled = true;
  num fontSizeFactor = 1.0;
  String _prefix = 'settings_';

  void _loadSavedSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkThemeEnabled = prefs.getBool(_prefix + 'isDarkThemeEnabled') ?? true;

    String languageCode = prefs.getString(_prefix + 'languageCode');
    if (languageCode != null) locale = Locale(languageCode);

    fontSizeFactor = prefs.getDouble(_prefix + 'fontSizeFactor') ?? 1.0;

    loaded = true;
    notifyListeners();
  }

  void _saveSetting(String settingName, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String settingNameWithPrefix = _prefix + settingName;
    if (value is bool) {
      prefs.setBool(settingNameWithPrefix, value);
    } else if (value is String) {
      prefs.setString(settingNameWithPrefix, value);
    } else if (value is List<String>) {
      prefs.setStringList(settingNameWithPrefix, value);
    } else if (value is double) {
      prefs.setDouble(settingNameWithPrefix, value);
    } else if (value is int) {
      prefs.setInt(settingNameWithPrefix, value);
    }
  }

  void switchLocale(Locale newLocale) {
    locale = newLocale;
    _saveSetting('languageCode', newLocale.languageCode);
    notifyListeners();
  }

  bool toggleDarkTheme(bool enabled) {
    isDarkThemeEnabled = enabled;
    _saveSetting('isDarkThemeEnabled', enabled);
    notifyListeners();
    return enabled;
  }

  num changeFontSizeFactor(newFontSizeFactor) {
    fontSizeFactor = newFontSizeFactor;
    _saveSetting('fontSizeFactor', newFontSizeFactor);
    notifyListeners();
    return newFontSizeFactor;
  }
}