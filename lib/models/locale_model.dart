import 'package:flutter/material.dart';

class LocaleModel with ChangeNotifier {
  Locale locale;

  void change(Locale newLocale) {
    locale = newLocale;
    notifyListeners();
  }
}