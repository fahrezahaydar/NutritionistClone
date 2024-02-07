import 'package:flutter/material.dart';

class CheckList extends StatelessWidget {
  final bool condition;
  const CheckList({super.key, required this.condition});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: condition ? color.primary : color.outline),
      alignment: Alignment.center,
      child: Icon(
        condition ? Icons.check : Icons.close,
        size: 20,
        color: color.background,
      ),
    );
  }
}
