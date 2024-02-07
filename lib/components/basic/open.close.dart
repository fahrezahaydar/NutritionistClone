import 'package:flutter/material.dart';

class OpenClose extends StatelessWidget {
  final bool condition;
  final void Function()? onTap;
  const OpenClose({super.key, required this.condition, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: condition ? color.primary : color.outline),
        alignment: Alignment.center,
        child: Icon(
          condition ? Icons.add : Icons.close,
          size: 20,
          color: color.background,
        ),
      ),
    );
  }
}
