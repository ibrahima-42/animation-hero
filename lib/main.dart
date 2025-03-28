import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animationtest/theme/theme_provider.dart';
import 'package:animationtest/theme/theme.dart' show AppTheme;
import 'package:animationtest/setting.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeState); // Écoute l'état du thème

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appTheme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Setting(
        toggletheme: appTheme.toggleTheme, 
        isDark: appTheme.isDarkMode,
      ), // Utiliser Setting pour tester
    );
  }
}
