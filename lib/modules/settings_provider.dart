import 'package:flutter/material.dart';

/// observer design pattern
/// singleton design pattern
class SettingsProvider extends ChangeNotifier {
  String currentLanguage = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (newLanguage == currentLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  bool isDark() => currentTheme == ThemeMode.dark;

}
