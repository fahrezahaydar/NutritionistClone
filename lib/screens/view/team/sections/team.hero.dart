import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/basic/random.photo.dart';
import 'package:nutritionist/components/content.header.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:nutritionist/screens/controller/team.view.model.dart';
import 'package:nutritionist/utils/spacer.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/basic/column.row.dart';
import '../../../../components/basic/text.dart';
import '../../../../data/content/team.content.dart';

class TeamHero extends StatelessWidget {
  const TeamHero({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final get = Get.find<TeamController>();
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
                  ContentHeader(header: teamHeader)
                ],
              ),
            ),
            Container(
                height: 100,
                width: context.width,
                color: color.primary,
                padding: isMobileTablet
                    ? const EdgeInsets.symmetric(horizontal: 20)
                    : EdgeInsets.zero,
                alignment:
                    isMobileTablet ? Alignment.centerLeft : Alignment.center,
                child: Obx(
                  () => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(team.length, (i) {
                        return TextButton(
                          onPressed: () => get.team.value = i,
                          style: TextButton.styleFrom(
                              backgroundColor: i != get.team.value
                                  ? color.primary
                                  : color.background.withOpacity(0.1),
                              foregroundColor: color.background,
                              padding: const EdgeInsets.all(16)),
                          child: WebText(team[i]),
                        );
                      }),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
