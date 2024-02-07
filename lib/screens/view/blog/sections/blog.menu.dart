import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/data/content/blog.content.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/basic/column.row.dart';
import '../../../../components/basic/logo.dart';
import '../../../../components/basic/text.dart';
import '../../../../res/size/size.dart';
import '../../../controller/blog.view.model.dart';

class BlogMenuSections extends StatelessWidget {
  const BlogMenuSections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final get = Get.find<BlogController>();
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final is2K = ResponsiveBreakpoints.of(context).largerThan(DESKTOP);
    return WebPaddingAll(
      padding: SizePartner.mainPadding,
      child: Container(
        decoration: BoxDecoration(
          color: color.primary.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.primary.withOpacity(0.1)),
        ),
        clipBehavior: Clip.hardEdge,
        child: Obx(() {
          var filteredList = get.blog.value == 0
              ? blogData
              : blogData
                  .where((blog) => blog["category"] == blogList[get.blog.value])
                  .toList();
          int listLength = filteredList.length;
          bool isEven = listLength % 2 == 0;
          int length = isEven ? listLength ~/ 2 : listLength ~/ 2 + 1;
          return WebColumn(
              withDivider: true,
              children: List.generate(length, (index) {
                bool lastRow = index != length - 1;
                return ResponsiveRowColumn(
                    rowSpacing: 20,
                    columnSpacing: 20,
                    layout: isMobileTablet
                        ? ResponsiveRowColumnType.COLUMN
                        : ResponsiveRowColumnType.ROW,
                    children: List.generate(2, (i) {
                      int number = index * 2 + i;
                      bool lastNumber = (index * 2 + i) == listLength - 1;
                      bool hide = isEven || lastRow || lastNumber;
                      double factor = isMobileTablet
                          ? context.width
                          : !is2K
                              ? context.width / 2
                              : context.width * 5 / 8;
                      return ResponsiveRowColumnItem(
                        rowFlex: 1,
                        rowFit: FlexFit.tight,
                        child: ResponsiveVisibility(
                          visible: !isMobileTablet ? true : hide,
                          child: WebPaddingAll(
                            padding: const SizePartner(30, 40),
                            child: hide
                                ? WebColumn(
                                    columnSpacing: 30,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                width: 3, color: color.primary),
                                          ),
                                        ),
                                        child: WebText.semiBold(
                                          filteredList[number]["category"]!,
                                          fontSize: const SizePartner(18, 24),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Spacer(),
                                          Container(
                                            width: 4 / 7 * factor,
                                            height: 2 / 7 * factor,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(
                                                    isMobileTablet ? 10 : 20),
                                              ),
                                            ),
                                            child: Image.asset(
                                              image(filteredList[number]
                                                  ["image"]!),
                                              alignment: Alignment.center,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )
                                        ],
                                      ),
                                      ResponsiveRowColumn(
                                          rowSpacing: 40,
                                          columnSpacing: 20,
                                          layout: isMobileTablet
                                              ? ResponsiveRowColumnType.COLUMN
                                              : ResponsiveRowColumnType.ROW,
                                          children: [
                                            ResponsiveRowColumnItem(
                                                rowFlex: 1,
                                                child: WebColumn(
                                                  columnSpacing: 10,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    WebText.semiBold(
                                                      filteredList[number]
                                                          ["title"]!,
                                                      fontSize:
                                                          const SizePartner(
                                                              16, 20),
                                                    ),
                                                    WebText(filteredList[number]
                                                        ["subtitle"]!),
                                                  ],
                                                )),
                                            ResponsiveRowColumnItem(
                                                rowFlex: 0,
                                                child: FilledButton(
                                                    onPressed: () {},
                                                    child: WebText.semiBold(
                                                        "Read More")))
                                          ])
                                    ],
                                  )
                                : const SizedBox(),
                          ),
                        ),
                      );
                    }));
              }));
        }),
      ),
    );
  }
}
