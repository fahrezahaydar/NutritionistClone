import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ScrollPlatform extends StatelessWidget {
  final Widget child;
  final Axis scrollDirection;
  const ScrollPlatform({
    super.key,
    required this.child,
    this.scrollDirection = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    return isMobileTablet
        ? SingleChildScrollView(
            scrollDirection: scrollDirection,
            child: child,
          )
        : child;
  }
}
