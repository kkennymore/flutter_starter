import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ksmart/components/language_dropdown.dart';
import 'package:ksmart/theme/theme_switch_toggle.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: const LanguageDropdown(),
        ),
        leadingWidth: 150,
        title: Text(context.tr("home")),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child:  const ThemeSwitchToggle(),
            ),
            const SizedBox(height: 20),
            
          ],
        )
      ),
      ),
    );
  }
}
