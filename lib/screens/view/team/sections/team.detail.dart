import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/basic/text.dart';
import 'package:nutritionist/data/content/team.content.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/basic/logo.dart';
import '../../../controller/team.view.model.dart';

class TeamDetail extends StatelessWidget {
  const TeamDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final get = Get.find<TeamController>();
    return WebPaddingSymetric(
        horizontal: SizePartner.mainPadding,
        child: Obx(
          () => ResponsiveRowColumn(
            layout: isMobileTablet
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowSpacing: 20,
            columnSpacing: 70,
            children: List.generate(4, (i) {
              return ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: TeamPhotos(
                    data: teamDetail[get.team.value][i],
                  ));
            }),
          ),
        ));
  }
}

class TeamPhotos extends StatelessWidget {
  final Map<String, String> data;
  const TeamPhotos({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(image(data["image"]!), fit: BoxFit.fitWidth),
        Positioned(
          bottom: -50,
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: 250,
            height: 80,
            decoration: BoxDecoration(
                color: color.primary,
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WebText.bold(
                  data["name"]!,
                  fontSize: const SizePartner(20, 20),
                  color: color.background,
                ),
                WebText(
                  data["job"]!,
                  fontSize: const SizePartner(14, 14),
                  overflow: TextOverflow.ellipsis,
                  color: color.background,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
