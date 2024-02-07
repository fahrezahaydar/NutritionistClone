import 'package:flutter/material.dart';
import 'package:nutritionist/components/content/features.content.dart';
import 'package:nutritionist/data/content/home.content.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/content.header.dart';
import '../../../../utils/spacer.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    return WebPaddingAll(
      padding: SizePartner.mainPadding,
      child: Column(
        children: [
          ContentHeader(header: featuresHeader),
          const VerticalSpace(40),
          ResponsiveRowColumn(
            layout: isMobileTablet
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            columnSpacing: 20,
            rowSpacing: 20,
            children: [
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Column(
                    children: [
                      for (int i = 0; i < featuresData.length / 2; i++) ...[
                        if (i != 0) const VerticalSpace(20),
                        FeatureContent(
                          padding: const EdgeInsets.all(30),
                          content: featuresData[i],
                        ),
                      ]
                    ],
                  )),
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Column(
                    children: [
                      for (int i = featuresData.length ~/ 2;
                          i < featuresData.length;
                          i++) ...[
                        if (i != featuresData.length ~/ 2)
                          const VerticalSpace(20),
                        FeatureContent(
                          padding: const EdgeInsets.all(30),
                          content: featuresData[i],
                        ),
                      ]
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
