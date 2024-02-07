import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/basic/text.dart';
import 'package:nutritionist/components/content.header.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/basic/logo.dart';
import '../../../../data/content/about.content.dart';
import '../../../../utils/spacer.dart';

class StorySection extends StatelessWidget {
  const StorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final color = Theme.of(context).colorScheme;
    return WebPaddingAll(
      padding: SizePartner.mainPadding,
      child: Column(
        children: [
          ContentHeader(header: storyHeader),
          const VerticalSpace(40),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: color.primary.withOpacity(0.05)),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: List.generate(4, (i) {
                bool even = i % 2 == 1;
                return ResponsiveRowColumn(
                  layout: isMobileTablet
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  children: [
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      rowOrder: even ? 1 : 3,
                      child: Image.asset(
                        image(storyData[i]["image"]!),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      rowOrder: 2,
                      child: isMobileTablet
                          ? Divider(color: color.primary, thickness: 10)
                          : Container(
                              color: color.primary,
                              width: 10,
                              height: 265 / 789 * (context.width - 170),
                            ),
                    ),
                    ResponsiveRowColumnItem(
                      rowOrder: even ? 3 : 1,
                      rowFlex: 1,
                      child: StoryContent(data: storyData[i]),
                    ),
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

class StoryContent extends StatelessWidget {
  final Map<String, String> data;
  final bool inRight;

  const StoryContent({super.key, required this.data, this.inRight = false});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return WebPaddingAll(
      padding: SizePartner.contentPadding,
      child: Column(
        crossAxisAlignment:
            inRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: color.primary, width: 3),
                ),
              ),
              child: WebText.bold(
                data["title"]!,
                fontSize: const SizePartner(21, 24),
              )),
          const VerticalSpace(20),
          WebText(
            data["text"]!,
            textAlign: inRight ? TextAlign.right : TextAlign.left,
          ),
          const VerticalSpace(20),
          WebText.bold(data["date"]!, fontSize: const SizePartner(14, 16)),
        ],
      ),
    );
  }
}
