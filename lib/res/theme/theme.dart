import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutritionist/res/theme/color_scheme.dart';

import 'widget/elevated.button.dart';
import 'widget/filled.button.dart';
import 'widget/input.decoration.dart';

class WebTheme {
  static final light = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      //colorScheme: lightScheme,
      colorSchemeSeed: darkGreen15,
      filledButtonTheme: FilledButtonThemeData(style: lightButton),
      elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButton),
      inputDecorationTheme: inputDecoration,
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        textStyle: GoogleFonts.urbanist(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: lightScheme.surfaceVariant,
        foregroundColor: lightScheme.onBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      )));

  static final dark = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      //colorScheme: darkScheme,
      colorSchemeSeed: darkGreen15,
      filledButtonTheme: FilledButtonThemeData(style: darkButton),
      elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButton),
      inputDecorationTheme: inputDecoration,
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        textStyle: GoogleFonts.urbanist(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: darkScheme.surfaceVariant,
        foregroundColor: darkScheme.onBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      )));
}
