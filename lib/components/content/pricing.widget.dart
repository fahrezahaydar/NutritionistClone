import 'package:flutter/material.dart';
import 'package:nutritionist/components/basic/column.row.dart';
import 'package:nutritionist/utils/spacer.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../res/size/details/size.partner.dart';
import '../basic/text.dart';

class PricingWidget extends StatelessWidget {
  final Map<String, dynamic> pricingList;
  final bool isMonthly;
  final bool withFeatures;
  const PricingWidget({
    super.key,
    required this.pricingList,
    required this.isMonthly,
    this.withFeatures = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    return Container(
      padding: EdgeInsets.all(isMobile ? 30 : 40),
      decoration: BoxDecoration(
          color: color.primary.withOpacity(0.10),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.primary.withOpacity(0.15))),
      clipBehavior: Clip.hardEdge,
      child: WebColumn(
          columnSpacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WebText.bold(pricingList['title'],
                fontSize: const SizePartner(21, 24)),
            WebText(pricingList['label'],
                color: color.onBackground.withOpacity(0.8)),
            WebText(pricingList['subtitle']),
            if (withFeatures)
              Container(
                decoration: BoxDecoration(
                  color: color.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(20),
                child: WebColumn(
                  columnSpacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      List.generate(pricingList['features'].length, (index) {
                    return WebColumn(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      columnSpacing: 10,
                      children: [
                        if (index == 0) const VerticalSpace(0),
                        WebText(pricingList['features'][index]),
                        if (index != pricingList['features'].length - 1)
                          Divider(
                              color: color.primary.withOpacity(0.8),
                              thickness: 1)
                      ],
                    );
                  }),
                ),
              ),
            if (withFeatures && pricingList.containsKey("special"))
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: color.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: WebText(
                  pricingList['special'],
                  color: color.background,
                ),
              ),
            Row(
              children: [
                WebText.bold(
                  isMonthly
                      ? pricingList['price']["monthly"]
                      : pricingList['price']["yearly"],
                  fontSize: const SizePartner(36, 48),
                  color: color.primary,
                ),
                WebText(
                  isMonthly ? "/month" : "/year",
                ),
              ],
            ),
            FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  foregroundColor: color.background,
                  minimumSize: const Size.fromHeight(56),
                ),
                child: const Text('Choose Plan'))
          ]),
    );
  }
}
