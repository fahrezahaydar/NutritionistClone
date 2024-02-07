import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/basic/column.row.dart';
import 'package:nutritionist/components/content.header.dart';
import 'package:nutritionist/components/content/blog.content.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../data/content/home.content.dart';
import '../../../../utils/spacer.dart';
import '../../../controller/home.view.model.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final get = Get.find<HomeController>();

    return WebPaddingSymetric(
      horizontal: SizePartner.mainPadding,
      child: Column(children: [
        ContentHeader(header: blogHeader),
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
                child: Obx(
                  () => WebColumn(columnSpacing: 20, children: [
                    for (int i = 0; i < blogData.length; i += 2) ...[
                      BlogContent(
                        data: blogData[i],
                        personData: test[i],
                        bookmark: get.bmark[i].value,
                        markPress: () => get.bmark[i].toggle(),
                        fav: get.fav[i].value,
                        favPress: () => get.fav[i].toggle(),
                      )
                    ]
                  ]),
                ),
              ),
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: WebColumn(columnSpacing: 20, children: [
                    for (int i = 1; i < blogData.length; i += 2) ...[
                      BlogContent(
                        data: blogData[i],
                        personData: test[i],
                        bookmark: get.bmark[i].value,
                        markPress: () => get.bmark[i].toggle(),
                        fav: get.fav[i].value,
                        favPress: () => get.fav[i].toggle(),
                      )
                    ]
                  ])),
            ]),
      ]),
    );
  }
}

final test = List.generate(
    4,
    (index) => {
          "name": "${Faker().person.firstName()} ${Faker().person.lastName()}",
          "image": Faker().image.image(
                width: 48,
                height: 48,
                keywords: ["person"],
                random: true,
              )
        });
