import 'package:flutter/material.dart';

class WebDivider extends StatelessWidget {
  final Widget? child;
  final bool condition;
  const WebDivider({super.key, this.child, this.condition = false});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: color.primary)),
      ),
      child: child,
    );
  }
}
