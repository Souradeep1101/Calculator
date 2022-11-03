import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThemeManager with ChangeNotifier {
  bool keyCheck = true;
  bool themeCheck = true;
  IconData themeCheckIcon = FontAwesomeIcons.solidSun;
  Color backgroundColor = Colors.white70;

  void onLightTheme(bool set) {
    if (set) {
      AdaptiveTheme.of(navigatorKey.currentContext!).setLight();
    }
    keyCheck = true;
    themeCheckIcon = FontAwesomeIcons.solidSun;
    backgroundColor = Colors.white70;
    themeCheck = true;
    notifyListeners();
  }

  void onDarkTheme(bool set) {
    if (set) {
      AdaptiveTheme.of(navigatorKey.currentContext!).setDark();
    }
    keyCheck = false;
    themeCheckIcon = FontAwesomeIcons.solidMoon;
    backgroundColor = Colors.grey[900]!;
    themeCheck = false;
    notifyListeners();
  }
}
