import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Images extends StatelessWidget {
  final Decoration? decoration;
  final BoxFit? fit;
  final String name;
  final Size mobile;
  final Size tablet;
  final Size desktop;

  const Images(this.name,
      {super.key,
      this.decoration,
      this.fit,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return Container(
      height: !isMobileTablet
          ? desktop.height
          : !isMobile
              ? tablet.height
              : mobile.height,
      width: !isMobileTablet
          ? desktop.width
          : !isMobile
              ? tablet.width
              : mobile.width,
      clipBehavior: Clip.hardEdge,
      decoration: decoration,
      child: Image.asset(
        name,
        fit: fit,
      ),
    );
  }
}
