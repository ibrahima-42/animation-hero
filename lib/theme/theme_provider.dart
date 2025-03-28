import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider de l'état du thème
final appThemeState = ChangeNotifierProvider((ref) => AppThemeState());

class AppThemeState extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme(bool isDark) {
    isDarkMode = isDark;
    notifyListeners(); // Notifie toutes les pages du changement
  }
}
