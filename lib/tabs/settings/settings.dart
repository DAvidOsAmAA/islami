import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String language = "en";
  String get backgroundImageName =>
      themeMode == ThemeMode.light ? 'default_bg' : 'dark_bg';

  void changeTheme(ThemeMode selectedTheme) {
    themeMode = selectedTheme;
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage) {
    if (selectedLanguage == language) return;
    language = selectedLanguage;
    notifyListeners();
  }
}
