import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/content/pricing.widget.dart';
import 'package:nutritionist/screens/controller/pricing.view.model.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/basic/column.row.dart';
import '../../../../components/basic/text.dart';
import '../../../../components/content/choice.button.dart';
import '../../../../data/content/pricing.content.dart';
import '../../../../res/size/size.dart';

class PricingDetailSection extends StatelessWidget {
  const PricingDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final controller = Get.find<PricingController>();
    return WebPaddingSymetric(
        horizontal: SizePartner.mainPadding,
        child: WebColumn(
          columnSpacing: 20,
          children: [
            Obx(() => ChoiceButton(
                  isMonthly: controller.isMonthly.value,
                  monthly: () => controller.isMonthly.value = true,
                  yearly: () => controller.isMonthly.value = false,
                )),
            const WebText('Save 50% on Yearly'),
            Obx(() => ResponsiveRowColumn(
                layout: isMobileTablet
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                columnSpacing: 20,
                rowSpacing: 20,
                rowCrossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(3, (i) {
                  return ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: PricingWidget(
                        pricingList: pricingList[i],
                        withFeatures: true,
                        isMonthly: controller.isMonthly.value,
                      ));
                })))
          ],
        ));
  }
}
