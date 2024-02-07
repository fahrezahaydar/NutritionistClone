import 'package:flutter/material.dart';
import 'package:nutritionist/utils/spacer.dart';

class ContentNavigation extends StatelessWidget {
  final void Function()? leftPressed;
  final void Function()? rightPressed;
  final int indicator;

  const ContentNavigation({
    super.key,
    this.leftPressed,
    this.rightPressed,
    required this.indicator,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(side: BorderSide.none),
          onPressed: leftPressed,
          child: const Icon(Icons.chevron_left, size: 30),
        ),
        const HorizontalSpace(10),
        Row(
          children: [
            for (int j = 0; j < 5; j++) ...[
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                    color: indicator % 5 == j ? color.primary : color.outline,
                    shape: BoxShape.circle),
              ),
              if (j != 5) const HorizontalSpace(5)
            ]
          ],
        ),
        const HorizontalSpace(10),
        OutlinedButton(
          style: OutlinedButton.styleFrom(side: BorderSide.none),
          onPressed: rightPressed,
          child: const Icon(Icons.chevron_right, size: 30),
        )
      ],
    );
  }
}
