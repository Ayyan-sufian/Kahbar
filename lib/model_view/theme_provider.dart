import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;





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