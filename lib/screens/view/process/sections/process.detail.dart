import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/background/numbered.dart';
import 'package:nutritionist/components/basic/column.row.dart';
import 'package:nutritionist/components/content.navigation.dart';
import 'package:nutritionist/components/content/features.content.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:nutritionist/screens/controller/process.view.model.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/content.header.dart';
import '../../../../data/content/process.content.dart';

class ProcessDetail extends StatelessWidget {
  const ProcessDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    final get = Get.find<ProcessController>();

    return WebPaddingSymetric(
      horizontal: SizePartner.mainPadding,
      child: Column(
        children: [
          ContentHeader(header: howItWork),
          ResponsiveVisibility(
            visible: !isMobile,
            child: WebColumn(
              columnSpacing: 20,
              children: List.generate(processDetail.length ~/ 2, (index) {
                int i = index * 2;
                return WebRow(
                  rowSpacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: NumberedBackground(
                        number: i,
                        child: FeatureContent(
                          content: processDetail[i],
                          padding: const EdgeInsets.all(30),
                        ),
                      ),
                    ),
                    Expanded(
                      child: NumberedBackground(
                        number: i + 1,
                        child: FeatureContent(
                          content: processDetail[i + 1],
                          padding: const EdgeInsets.all(30),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          ResponsiveVisibility(
              visible: isMobile,
              child: Obx(() => WebColumn(
                    columnSpacing: 20,
                    children: [
                      NumberedBackground(
                        number: get.mobileCount.value,
                        child: FeatureContent(
                          content: processDetail[get.mobileCount.value],
                          padding: const EdgeInsets.all(30),
                        ),
                      ),
                      ContentNavigation(
                        indicator: get.mobileCount.value,
                        leftPressed: () => get.prev(),
                        rightPressed: () => get.next(processDetail.length),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
