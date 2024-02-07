import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/basic/text.dart';
import '../../../../res/size/size.dart';

class NumberedBackground extends StatelessWidget {
  final Widget child;
  final int number;
  const NumberedBackground(
      {super.key, required this.child, required this.number});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    return Stack(
      children: [
        WebText.bold(
          "0${number + 1}",
          color: color.primary,
          fontSize: const SizePartner(80, 100),
        ),
        Column(
          children: [SizedBox(height: isMobileTablet ? 72 : 90), child],
        ),
      ],
    );
  }
}
