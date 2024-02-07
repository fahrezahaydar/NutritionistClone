import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/res/size/details/padding.dart';
import 'package:nutritionist/res/size/details/size.partner.dart';
import 'package:nutritionist/screens/controller/home.view.model.dart';
import 'package:nutritionist/utils/spacer.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/basic/text.dart';
import '../../../../components/content.header.dart';
import '../../../../components/content/choice.button.dart';
import '../../../../data/content/home.content.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final c = Get.find<HomeController>();
    return WebPaddingSymetric(
        horizontal: SizePartner.mainPadding,
        child: Column(
          children: [
            ContentHeader(header: pricingHeader),
            const VerticalSpace(40),
            Obx(() => ChoiceButton(
                  isMonthly: c.isMonthly.value,
                  monthly: () => c.isMonthly.value = true,
                  yearly: () => c.isMonthly.value = false,
                )),
            const VerticalSpace(20),
            const WebText('Save 50% on Yearly'),
            const VerticalSpace(20),
            Obx(() => ResponsiveRowColumn(
                layout: isMobileTablet
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                columnSpacing: 20,
                rowSpacing: 20,
                children: List.generate(3, (i) {
                  return ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: PricingDetail(
                        pricingList: pricingList[i],
                        isMonthly: c.isMonthly.value,
                      ));
                })))
          ],
        ));
  }
}

class PricingDetail extends StatelessWidget {
  final Map<String, dynamic> pricingList;
  final bool isMonthly;
  const PricingDetail(
      {super.key, required this.pricingList, required this.isMonthly});

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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        WebText.bold(pricingList['title'], fontSize: const SizePartner(21, 24)),
        WebText(pricingList['label'],
            color: color.onBackground.withOpacity(0.8)),
        const VerticalSpace(20),
        WebText(pricingList['subtitle']),
        const VerticalSpace(20),
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
        const VerticalSpace(20),
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
