import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutritionist/res/theme/color_scheme.dart';

final color = ColorScheme.fromSeed(seedColor: darkGreen15);

InputDecorationTheme inputDecoration = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color.primary),
  ),
  fillColor:
      ColorScheme.fromSeed(seedColor: darkGreen15).primary.withOpacity(0.2),
  filled: true,
  outlineBorder: BorderSide(color: color.primary),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color.primary),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color.primary),
  ),
  hintStyle: GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.w300,
  ),
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  hoverColor: color.primary.withOpacity(0.2),
);
