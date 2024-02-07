import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ButtonIcon extends StatelessWidget {
  final IconData? icon;
  final void Function()? onPressed;
  const ButtonIcon({super.key, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    final color = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: isMobile ? 48 : 56,
        width: isMobile ? 48 : 56,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color.primary.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: color.onBackground),
      ),
    );
  }
}
