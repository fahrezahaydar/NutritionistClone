import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  const ChoiceButton({
    super.key,
    required this.isMonthly,
    this.monthly,
    this.yearly,
  });

  final bool isMonthly;
  final void Function()? monthly;
  final void Function()? yearly;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: color.primary),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FilledButton(
              onPressed: monthly,
              style: FilledButton.styleFrom(
                foregroundColor:
                    isMonthly ? color.background : color.onBackground,
                backgroundColor: isMonthly ? color.primary : color.background,
              ),
              child: const Text('Monthly')),
          FilledButton(
              onPressed: yearly,
              style: FilledButton.styleFrom(
                foregroundColor:
                    !isMonthly ? color.background : color.onBackground,
                backgroundColor: !isMonthly ? color.primary : color.background,
              ),
              child: const Text('Yearly')),
        ],
      ),
    );
  }
}
