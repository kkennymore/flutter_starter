import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

ThemeData get lightTheme {
  return  ThemeData(
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightAccent,
      // Add other colors as needed
    ),
    brightness: Brightness.light,
    textTheme: GoogleFonts.latoTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.buttonTextColor, 
        backgroundColor: AppColors.lightPrimary, // Text color
      ),
    ),
    // Apply similar customizations for TextButton and OutlinedButton
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.lightAccent, // Text color
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.lightPrimary, 
        side:const BorderSide(color: AppColors.lightAccent), // Border color
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.lightAccent,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.progressIndicatorColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightPrimary),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightAccent),
      ),
    ),
    useMaterial3: true,
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.lightAccent; // Color when on
          }
          return Colors.grey; // Color when off
        },
      ),
      trackColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.lightPrimary.withOpacity(0.5); // Track color when on
          }
          return Colors.grey.withOpacity(0.5); // Track color when off
        },
      ),
    ),
    // Additional widget themes as needed...
  );
}

ThemeData get darkTheme {
  return ThemeData(
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme:const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkAccent,
      // Add other colors as needed
    ),
    brightness: Brightness.dark,
    textTheme: GoogleFonts.latoTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.buttonTextColor, 
        backgroundColor: AppColors.darkPrimary, // Text color
      ),
    ),
    // Apply similar customizations for TextButton and OutlinedButton
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.darkAccent, // Text color
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.darkPrimary, 
        side: const BorderSide(color: AppColors.darkAccent), // Border color
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.darkAccent,
    ),
    progressIndicatorTheme:const ProgressIndicatorThemeData(
      color: AppColors.progressIndicatorColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkPrimary),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkAccent),
      ),
    ),
    switchTheme: SwitchThemeData(
      materialTapTargetSize: MaterialTapTargetSize.padded,
      thumbColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.progressIndicatorColor; // Color when on
          }
          return Colors.grey; // Color when off
        },
      ),
      trackColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.darkPrimary.withOpacity(0.3); // Track color when on
          }
          return Colors.grey.withOpacity(0.1); // Track color when off
        },
      ),
    ),
    useMaterial3: true,
    // Additional widget themes as needed...
  );
}
