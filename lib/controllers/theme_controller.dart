import 'package:desenvolvimento_flutter_iniciante/themes/themes.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  bool isLightTheme = true;

  ThemeData get currentTheme => isLightTheme ? lightTheme : darkTheme;

  void toggleTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }
}