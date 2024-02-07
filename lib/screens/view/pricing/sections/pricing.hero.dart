import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/basic/column.row.dart';
import '../../../../components/basic/random.photo.dart';
import '../../../../components/content.header.dart';
import '../../../../data/content/pricing.content.dart';
import '../../../../res/size/size.dart';
import '../../../../utils/spacer.dart';

class PricingHero extends StatelessWidget {
  const PricingHero({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    return WebPaddingAll(
      padding: SizePartner.mainPadding,
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          color: color.primary.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.primary.withOpacity(0.1)),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(isMobileTablet ? 30 : 80),
              child: WebColumn(
                children: [
                  const SquareLogo(),
                  const VerticalSpace(40),
                  ContentHeader(header: pricingHero)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
