import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../size.dart';

class CustomPadding {
  static EdgeInsetsGeometry get banner {
    final isMobileTablet =
        ResponsiveBreakpoints.of(Get.context!).smallerThan(DESKTOP);
    return EdgeInsets.only(
      bottom: 20,
      left: isMobileTablet ? 20 : 80,
      right: isMobileTablet ? 20 : 80,
    );
  }

  static EdgeInsetsGeometry all(SizePartner value) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(Get.context!).smallerThan(DESKTOP);
    return EdgeInsets.all(isMobileTablet ? value.mobile : value.desktop);
  }

  static EdgeInsetsGeometry get appbar =>
      EdgeInsets.all(isMobileTablet ? 20 : 80);
}

class WebPaddingAll extends StatelessWidget {
  final SizePartner padding;
  final Widget? child;
  const WebPaddingAll({super.key, required this.padding, this.child});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return Padding(
      padding:
          EdgeInsets.all(isMobileTablet ? padding.mobile : padding.desktop),
      child: child,
    );
  }
}

class WebPaddingSymetric extends StatelessWidget {
  final SizePartner vertical;
  final SizePartner horizontal;
  final Widget? child;
  const WebPaddingSymetric(
      {super.key,
      this.child,
      this.vertical = const SizePartner(0, 0),
      this.horizontal = const SizePartner(0, 0)});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isMobileTablet ? horizontal.mobile : horizontal.desktop,
          vertical: isMobileTablet ? vertical.mobile : vertical.desktop),
      child: child,
    );
  }
}
