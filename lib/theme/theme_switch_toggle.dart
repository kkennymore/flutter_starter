import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ksmart/theme/theme_manager.dart';

class ThemeSwitchToggle extends ConsumerWidget {
  const ThemeSwitchToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    
    return Switch(
      value: themeMode == ThemeMode.dark,
      onChanged: (value) {
        ref.read(themeProvider.notifier).setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}
