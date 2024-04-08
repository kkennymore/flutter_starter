import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ksmart/screens/home_screen/home_screen.dart';
import 'package:ksmart/theme/theme_manager.dart';
import 'package:ksmart/theme/themedata.dart';

class RunApp extends ConsumerWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: "GOOOOOOOOOOO",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode, // Use the theme mode determined by the themeProvider
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomeScreen(),
    );
  }
}