import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsModel with ChangeNotifier {
  SettingsModel() {
    _load();
  }

  bool loaded = false;
  Locale locale;
  bool isDarkThemeEnabled;
  String prefix = 'settings_';

  void _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkThemeEnabled = prefs.getBool(prefix + 'isDarkThemeEnabled') ?? true;

    String languageCode = prefs.getString(prefix + 'languageCode');
    if (languageCode != null) locale = Locale(languageCode);
    loaded = true;
    notifyListeners();
  }

  void _saveSetting(String settingName, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String settingNameWithPrefix = prefix + settingName;
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
    this.isDarkThemeEnabled = enabled;
    _saveSetting('isDarkThemeEnabled', enabled);
    notifyListeners();
    return enabled;
  }
}