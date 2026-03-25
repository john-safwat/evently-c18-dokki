import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) async {
    if (themeMode == newTheme) return;
    themeMode = newTheme;
    notifyListeners();
    final pref = await SharedPreferences.getInstance();
    pref.setBool("isDark", isDark);
  }

  bool get isDark => themeMode == ThemeMode.dark;
  String get assetSuffix => isDark ? "dark" : "light";

  String local = "en";

  void changeLocal(String newLocal) async {
    if (local == newLocal) return;
    local = newLocal;
    notifyListeners();
    final pref = await SharedPreferences.getInstance();
    pref.setString("locale", local);
  }

  bool get isEn => local == "en";
}
