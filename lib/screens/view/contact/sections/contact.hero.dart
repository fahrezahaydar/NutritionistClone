import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/basic/random.photo.dart';
import 'package:nutritionist/components/basic/text.dart';
import 'package:nutritionist/components/content.header.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:nutritionist/utils/spacer.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:nutritionist/data/content/contact.content.dart';

import '../../../../components/basic/column.row.dart';

class ContactHero extends StatelessWidget {
  const ContactHero({super.key});

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
                  ContentHeader(header: contactHeader)
                ],
              ),
            ),
            Container(
              width: context.width,
              color: color.primary,
              padding: EdgeInsets.symmetric(
                  horizontal: isMobileTablet ? 20 : 80, vertical: 20),
              child: ResponsiveRowColumn(
                layout: isMobileTablet
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                rowSpacing: 20,
                rowMainAxisAlignment: MainAxisAlignment.center,
                columnSpacing: 20,
                children: List.generate(contactDetail.length, (i) {
                  return ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: color.background.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: isMobileTablet
                            ? BoxConstraints.tight(const Size.fromHeight(120))
                            : null,
                        padding: isMobileTablet
                            ? EdgeInsets.zero
                            : const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 80),
                        child: WebColumn(
                          columnSpacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              contactDetail[i]["icon"] as IconData,
                              color: color.background,
                              size: 24,
                            ),
                            WebText(
                              contactDetail[i]["title"] as String,
                              color: color.background,
                            )
                          ],
                        ),
                      ));
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
