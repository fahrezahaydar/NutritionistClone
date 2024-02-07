import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ButtonStyle lightButton = FilledButton.styleFrom(
  alignment: Alignment.center,
  padding: const EdgeInsets.all(20),
  textStyle: GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  ),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
);

ButtonStyle darkButton = ButtonStyle(
  alignment: Alignment.center,
  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
  textStyle: MaterialStateProperty.all(GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  )),
  shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
);
