import 'package:flutter/material.dart';

class WebColumn extends StatelessWidget {
  final List<Widget> children;
  final double columnSpacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool withDivider;
  final int dividerStart;

  const WebColumn({
    super.key,
    this.columnSpacing = 0,
    this.dividerStart = 0,
    this.withDivider = false,
    this.children = const <Widget>[],
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        for (int i = 0; i < children.length; i++) ...[
          if (i != 0) ...[
            SizedBox(height: columnSpacing / 2),
            if (withDivider && i > 0 + dividerStart)
              Divider(
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.5)),
            SizedBox(height: columnSpacing / 2)
          ],
          children[i],
        ]
      ],
    );
  }
}

class WebRow extends StatelessWidget {
  final List<Widget> children;
  final double rowSpacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const WebRow({
    super.key,
    this.rowSpacing = 0,
    this.children = const <Widget>[],
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        for (int i = 0; i < children.length; i++) ...[
          if (i != 0) SizedBox(width: rowSpacing),
          children[i],
        ]
      ],
    );
  }
}
