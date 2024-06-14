import 'package:flutter/material.dart';

class SettingController with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  void onOff(bool isDark) {
    if (isDark) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
