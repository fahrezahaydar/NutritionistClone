import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/basic/text.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/basic/checklist.dart';
import '../../../../components/basic/column.row.dart';
import '../../../../components/basic/scroll.platform.dart';
import '../../../../data/content/pricing.content.dart';
import '../../../../res/size/size.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

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
        padding: const EdgeInsets.all(30),
        clipBehavior: Clip.hardEdge,
        child: ScrollPlatform(
          child: SizedBox(
            width: isMobileTablet ? 1280 : null,
            child: WebColumn(
              withDivider: true,
              dividerStart: 1,
              children: [
                WebRow(
                  rowSpacing: 20,
                  children: List.generate(pricingPlan.length, (i) {
                    int flex = pricingPlan[i].values.first;
                    return Expanded(
                      flex: flex,
                      child: Container(
                        decoration: BoxDecoration(
                          color: color.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 36),
                        alignment:
                            flex == 1 ? Alignment.center : Alignment.centerLeft,
                        child: WebText(
                          pricingPlan[i].keys.first,
                          color: color.background,
                        ),
                      ),
                    );
                  }),
                ),
                ...List.generate(features.length, (i) {
                  return WebRow(
                    rowSpacing: 20,
                    children: List.generate(pricingPlan.length, (index) {
                      int flex = pricingPlan[index].values.first;
                      bool isBool = flex == 1;
                      var value = features[i][pricingPlan[index].keys.first];
                      return Expanded(
                        flex: flex,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          alignment:
                              isBool ? Alignment.center : Alignment.centerLeft,
                          child: isBool
                              ? CheckList(condition: value as bool)
                              : WebText(
                                  value as String,
                                ),
                        ),
                      );
                    }),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
