import 'package:flutter/material.dart';
import 'package:nutritionist/components/basic/column.row.dart';
import 'package:nutritionist/components/content.header.dart';
import 'package:nutritionist/utils/spacer.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/content/features.content.dart';
import '../../../../data/content/about.content.dart';
import '../../../../res/size/size.dart';

class AchievementSection extends StatelessWidget {
  const AchievementSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    return WebPaddingAll(
      padding: SizePartner.mainPadding,
      child: WebColumn(
        columnSpacing: 20,
        children: [
          ContentHeader(header: achievement),
          const VerticalSpace(20),
          ...List.generate(achievementData.length ~/ 2, (i) {
            int line = i * achievementData.length ~/ 2;
            return ResponsiveRowColumn(
              layout: isMobileTablet
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              columnSpacing: 20,
              rowSpacing: 20,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  2,
                  (j) => ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: FeatureContent(
                          height: isMobileTablet ? null : 220,
                          padding: const EdgeInsets.all(30),
                          content: achievementData[line + j],
                        ),
                      )),
            );
          }),
        ],
      ),
    );
  }
}
