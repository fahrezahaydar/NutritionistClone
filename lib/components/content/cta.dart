import 'package:flutter/material.dart';
import 'package:nutritionist/components/basic/text.dart';
import 'package:nutritionist/components/content/cta.content.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../utils/spacer.dart';

class CTASection extends StatelessWidget {
  final Map<String, String> data;
  final void Function()? onPressed;
  const CTASection({super.key, required this.data, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    TextAlign textAlign = isMobileTablet ? TextAlign.center : TextAlign.start;
    final aligment =
        isMobileTablet ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    return WebPaddingAll(
      padding: SizePartner.mainPadding,
      child: CTABackgorund(
          child: ResponsiveRowColumn(
        rowMainAxisSize: MainAxisSize.max,
        rowPadding: const EdgeInsets.all(60),
        columnPadding: const EdgeInsets.all(40),
        rowSpacing: 150,
        columnSpacing: 20,
        layout: isMobileTablet
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              rowFlex: 1,
              child: Column(
                crossAxisAlignment: aligment,
                children: [
                  WebText.bold(data["title"]!, textAlign: textAlign),
                  const VerticalSpace(10),
                  WebText(data["subtitle"]!, textAlign: textAlign),
                ],
              )),
          ResponsiveRowColumnItem(
            rowFit: FlexFit.loose,
            rowFlex: 0,
            child: FilledButton(
                onPressed: () {},
                style:
                    FilledButton.styleFrom(foregroundColor: color.background),
                child: Text(data["buttonText"]!)),
          ),
        ],
      )),
    );
  }
}
