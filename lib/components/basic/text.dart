import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutritionist/res/size/details/size.partner.dart';
import 'package:responsive_framework/responsive_framework.dart';

class WebText extends StatelessWidget {
  final String data;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final SizePartner fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final double? height;

  const WebText(
    this.data, {
    super.key,
    this.textAlign,
    this.overflow,
    this.color,
    this.maxLines,
    this.fontWeight = FontWeight.w500,
    this.fontSize = const SizePartner(14, 16),
    this.height,
  });

  factory WebText.bold(
    String data, {
    Color? color,
    int? maxLines,
    double? height,
    TextAlign? textAlign,
    SizePartner fontSize = const SizePartner(18, 24),
  }) {
    return WebText(
      data,
      color: color,
      textAlign: textAlign,
      fontWeight: FontWeight.bold,
      maxLines: maxLines,
      fontSize: fontSize,
      height: height,
    );
  }

  factory WebText.semiBold(
    String data, {
    Color? color,
    TextAlign? textAlign,
    SizePartner fontSize = const SizePartner(14, 14),
  }) {
    return WebText(
      data,
      color: color,
      textAlign: textAlign,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    return Text(
      data,
      key: key,
      style: GoogleFonts.urbanist(
          fontWeight: fontWeight,
          color: color,
          fontSize: isMobileTablet ? fontSize.mobile : fontSize.desktop,
          height: height),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
