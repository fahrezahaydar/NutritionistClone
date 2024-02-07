import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist/components/basic/icon.button.dart';
import 'package:nutritionist/components/basic/logo.dart';
import 'package:nutritionist/components/basic/random.photo.dart';
import 'package:nutritionist/components/basic/text.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:nutritionist/utils/spacer.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BlogContent extends StatelessWidget {
  final Map<String, String> data;
  final Map<String, String> personData;
  final bool fav;
  final bool bookmark;
  final void Function()? favPress;
  final void Function()? markPress;

  const BlogContent(
      {super.key,
      required this.data,
      this.bookmark = false,
      this.fav = false,
      this.favPress,
      this.markPress,
      required this.personData});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color.primary.withOpacity(0.1)),
          color: color.primary.withOpacity(0.05)),
      child: WebPaddingAll(
        padding: const SizePartner(24, 30),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image(data["image"]!),
                  fit: BoxFit.fill,
                  width: context.width,
                ),
                const VerticalSpace(20),
                WebText(data["subtitle"]!),
                WebText(
                  data["title"]!,
                  fontWeight: FontWeight.w600,
                  fontSize: const SizePartner(18, 21),
                ),
                const VerticalSpace(20),
                WebText(
                  data["description"]!,
                  color: color.onSurfaceVariant,
                ),
              ],
            ),
            const VerticalSpace(20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: color.background),
              child: ResponsiveRowColumn(
                layout: isMobile
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                columnCrossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Photos(
                            imageUrl: personData["image"]!,
                            size: isMobile ? 48 : 56,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          const HorizontalSpace(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WebText(
                                personData["name"]!,
                                overflow: TextOverflow.ellipsis,
                                fontSize: const SizePartner(16, 18),
                                fontWeight: FontWeight.w600,
                              ),
                              const WebText(
                                '23 May 2023 - 5 min read',
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ButtonIcon(
                        icon: fav ? Icons.favorite : Icons.favorite_outline,
                        onPressed: favPress,
                      ),
                      ButtonIcon(
                        icon:
                            bookmark ? Icons.bookmark : Icons.bookmark_outline,
                        onPressed: markPress,
                      ),
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
