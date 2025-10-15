import 'package:desenvolvimento_flutter_iniciante/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  final SharedPreferences sharedPreferences;
  bool isLightTheme = true;

  ThemeController({required this.sharedPreferences});

  ValueNotifier<String> themeNotifier = ValueNotifier('');

  ThemeData get currentTheme => isLightTheme ? lightTheme : darkTheme;

  void toggleTheme() async {
    isLightTheme = !isLightTheme;
    await sharedPreferences.setBool('isLightTheme', isLightTheme);
    themeNotifier.value = 'Tema alterado para ${isLightTheme ? "Claro" : "Escuro"}';
    notifyListeners();
  }

    Future<void> loadThemePreference() async {
    final isLight = sharedPreferences.getBool('isLightTheme') ?? true;
    isLightTheme = isLight;
    notifyListeners();
  }
}