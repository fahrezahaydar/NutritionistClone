import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../components/basic/column.row.dart';
import '../../../../components/basic/random.photo.dart';
import '../../../../components/basic/text.dart';
import '../../../../components/content.header.dart';
import '../../../../data/content/blog.content.dart';
import '../../../../res/size/size.dart';
import '../../../../utils/spacer.dart';
import '../../../controller/blog.view.model.dart';

class BlogHeroSections extends StatelessWidget {
  const BlogHeroSections({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final get = Get.find<BlogController>();
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
                  ContentHeader(header: blogHeader)
                ],
              ),
            ),
            Container(
                height: 100,
                color: color.primary,
                padding:
                    EdgeInsets.symmetric(horizontal: isMobileTablet ? 20 : 80),
                alignment:
                    isMobileTablet ? Alignment.centerLeft : Alignment.center,
                child: Obx(
                  () => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: WebRow(
                      rowSpacing: isMobileTablet ? 20 : 40,
                      children: List.generate(blogList.length, (i) {
                        return TextButton(
                          onPressed: () => get.blog.value = i,
                          style: TextButton.styleFrom(
                              backgroundColor: i != get.blog.value
                                  ? color.primary
                                  : color.background.withOpacity(0.1),
                              foregroundColor: color.background,
                              padding: const EdgeInsets.all(16)),
                          child: WebText(blogList[i]),
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
