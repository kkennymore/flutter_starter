import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final localeProvider = StateProvider<Locale>((ref) {
  // Default to English, or initialize based on saved preferences or device settings
  return Locale('en');
});