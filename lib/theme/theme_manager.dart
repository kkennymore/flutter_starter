import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = StateNotifierProvider<ThemeManager, ThemeMode>((ref) {
  // Initialize the ThemeManager
  final manager = ThemeManager();
  // Load the theme mode asynchronously
  manager.loadThemeMode();
  return manager;
});

class ThemeManager extends StateNotifier<ThemeMode> {
  ThemeManager() : super(ThemeMode.system);

  Future<void> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeString = prefs.getString('themeMode') ?? ThemeMode.system.toString();
    // Ensure to use the setter to correctly notify listeners of the change
    setThemeMode(ThemeMode.values.firstWhere(
      (element) => element.toString() == themeModeString,
      orElse: () => ThemeMode.system,
    ));
  }

  void setThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', mode.toString());
    state = mode; 
  }
}
