import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomSize {
  static Size headerSize(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    return Size.fromHeight(isMobileTablet ? 180 : 160);
  }
}

class ResponsiveBox extends StatelessWidget {
  final Widget? child;
  final List<double>? height;
  final List<double>? width;
  const ResponsiveBox({super.key, this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    final nullHeight = height == null;
    final nullWidth = width == null;
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return SizedBox(
      height: nullHeight
          ? null
          : !isMobileTablet
              ? height![0]
              : !isMobile
                  ? height![1]
                  : height!.length == 2
                      ? height![1]
                      : height![2],
      width: nullWidth
          ? null
          : !isMobileTablet
              ? width![0]
              : !isMobile
                  ? width![1]
                  : width!.length == 2
                      ? width![1]
                      : width![2],
      child: child,
    );
  }
}
