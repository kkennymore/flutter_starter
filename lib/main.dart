import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ksmart/run_app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'), 
          Locale('es'),
          Locale('fr'), 
          Locale('sw'), 
          Locale('zu')
          ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const RunApp(),
      ),
    ),
  );
}


