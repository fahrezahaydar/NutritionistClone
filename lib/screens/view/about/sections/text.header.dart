import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/basic/column.row.dart';
import '../../../../components/basic/text.dart';
import '../../../../data/content/about.content.dart';
import '../../../../res/size/size.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    return WebPaddingSymetric(
      horizontal: SizePartner.mainPadding,
      child: Container(
        decoration: BoxDecoration(
            color: color.primary.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(isMobileTablet ? 30 : 40),
        child: WebColumn(
          columnSpacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WebText.bold(hero["title"]!, fontSize: const SizePartner(24, 36)),
            for (int i = 0; i < hero["paragraph"].length; i++) ...[
              WebText(hero["paragraph"]![i], textAlign: TextAlign.center),
            ]
          ],
        ),
      ),
    );
  }
}
