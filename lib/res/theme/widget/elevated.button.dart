import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ButtonStyle elevatedButton = ButtonStyle(
  alignment: Alignment.center,
  padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
  textStyle: MaterialStateProperty.all(GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  )),
  shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
);
