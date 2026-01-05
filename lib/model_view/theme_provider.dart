import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;


  bool isDark(BuildContext context) {
    if (_themeMode == ThemeMode.system) {
      return MediaQuery.of(context).platformBrightness == Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }



  void setSystem() {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }

  void lightMode() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }

  void darkMode() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }
}