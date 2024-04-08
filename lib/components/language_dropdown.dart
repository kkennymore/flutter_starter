import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ksmart/theme/app_colors.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> languages = [
      {"code": "en", "name": context.tr("english")},
      {"code": "fr", "name": context.tr("french")},
      {"code": "es", "name": context.tr("spanish")},
      {"code": "sw", "name": context.tr("swahili")},
      {"code": "zh", "name": context.tr("chinese")},
      {"code": "zu", "name": context.tr("zulu")},
    ];
    final currentLocale = context.locale;
    // Determine the brightness of the current theme
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return DropdownButton<String>(
      value: currentLocale.languageCode,
      onChanged: (String? newValue) {
        context.setLocale(Locale(newValue!));
      },
      items: languages.map<DropdownMenuItem<String>>((language) {
        return DropdownMenuItem<String>(
          value: language['code'],
          child: Text(language['name']!,
            // Conditional styling based on the theme
            style: TextStyle(color: isDarkTheme ? AppColors.darkPrimary : AppColors.darkBackground),
          ),
        );
      }).toList(),
      // It's important to also style the overall dropdown color here
      style: TextStyle(color: isDarkTheme ? AppColors.darkPrimary : AppColors.darkBackground),
    );
  }
}
