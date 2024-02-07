import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../basic/logo.dart';

class CTABackgorund extends StatelessWidget {
  final Widget child;
  const CTABackgorund({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final color = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: color.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.primary.withOpacity(0.1)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            left: -80,
            child: Image.asset(
              image('abstract1'),
              color: color.primary.withOpacity(0.1),
              height: isMobileTablet ? 135 : 120,
            ),
          ),
          Positioned(
            bottom: -40,
            right: -10,
            child: Image.asset(
              image('petal'),
              color: color.primary.withOpacity(0.1),
              height: isMobileTablet ? 135 : 120,
            ),
          ),
          child
        ],
      ),
    );
  }
}
