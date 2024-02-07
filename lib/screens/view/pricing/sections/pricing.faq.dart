import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/basic/open.close.dart';
import 'package:nutritionist/components/basic/text.dart';
import 'package:nutritionist/components/content.header.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:nutritionist/screens/controller/pricing.view.model.dart';
import 'package:nutritionist/utils/spacer.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/basic/column.row.dart';
import '../../../../components/basic/logo.dart';
import '../../../../data/content/pricing.content.dart';

class PricingFAQSection extends StatelessWidget {
  const PricingFAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    final get = Get.find<PricingController>();
    return WebPaddingSymetric(
      horizontal: SizePartner.mainPadding,
      child: Column(
        children: [
          ContentHeader(header: faqHeader),
          ResponsiveRowColumn(
            layout: isMobileTablet
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            rowSpacing: 20,
            columnSpacing: 20,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: color.primary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(isMobileTablet ? 30 : 40),
                  child: Obx(() => WebColumn(
                        columnSpacing: 20,
                        withDivider: true,
                        children: List.generate(faqData.length, (index) {
                          return Question(
                            data: faqData[index],
                            openAnswer: get.open[index].value,
                            onTap: () => get.open[index].toggle(),
                          );
                        }),
                      )),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: Container(
                  decoration: BoxDecoration(
                    color: color.primary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(isMobile ? 40 : 60),
                  child: WebColumn(
                    columnSpacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(image('petal'),
                          color: color.primary,
                          fit: BoxFit.fitHeight,
                          height: isMobile ? 80 : 120),
                      WebText.bold(
                        pricingCTA["title"]!,
                        fontSize: const SizePartner(28, 36),
                        textAlign: TextAlign.center,
                        color: color.primary,
                      ),
                      WebText(
                        pricingCTA["subtitle"]!,
                        textAlign: TextAlign.center,
                      ),
                      FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                            backgroundColor: color.primary,
                            foregroundColor: color.background),
                        child: WebText.semiBold(pricingCTA["buttonText"]!),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Question extends StatelessWidget {
  final Map<String, String> data;
  final bool openAnswer;
  final void Function()? onTap;
  const Question({
    super.key,
    required this.data,
    this.openAnswer = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    return WebColumn(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: isMobile ? context.width - 200 : null,
              child: WebText.bold(
                data["question"]!,
                fontSize: const SizePartner(16, 18),
                maxLines: 2,
                height: 1,
              ),
            ),
            HorizontalSpace(isMobile ? 20 : 80),
            OpenClose(
              condition: !openAnswer,
              onTap: onTap,
            )
          ],
        ),
        if (openAnswer) const VerticalSpace(20),
        Visibility(
            visible: openAnswer,
            child: WebText(
              data["answer"]!,
              textAlign: TextAlign.justify,
            ))
      ],
    );
  }
}
