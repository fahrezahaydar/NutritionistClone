import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/basic/column.row.dart';
import 'package:nutritionist/components/content.header.dart';
import 'package:nutritionist/components/content/testimonial.content.dart';
import 'package:nutritionist/data/content/home.content.dart';
import 'package:nutritionist/res/size/details/padding.dart';
import 'package:nutritionist/res/size/details/size.partner.dart';
import 'package:nutritionist/screens/controller/home.view.model.dart';
import 'package:nutritionist/utils/spacer.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/content.navigation.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final get = Get.find<HomeController>();

    return WebPaddingAll(
      padding: SizePartner.mainPadding,
      child: Column(
        children: [
          ContentHeader(header: testimonialHeader),
          const VerticalSpace(40),
          Obx(
            () => isMobileTablet
                ? TestimonialContent(get.nav.value, data: testimonialData)
                : WebRow(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    rowSpacing: 20,
                    children: List.generate(3, (i) {
                      int index = i * testimonialData.length ~/ 3;
                      return Expanded(
                        child: TestimonialContent(
                          get.nav.value + index,
                          data: testimonialData,
                        ),
                      );
                    }),
                  ),
          ),
          const VerticalSpace(20),
          Obx(
            () => ContentNavigation(
              indicator: get.nav.value,
              leftPressed: () => get.minus(),
              rightPressed: () => get.plus(
                isMobileTablet
                    ? testimonialData.length
                    : testimonialData.length ~/ 3,
              ),
            ),
          )
        ],
      ),
    );
  }
}
