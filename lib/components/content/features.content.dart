import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutritionist/components/basic/logo.dart';
import 'package:nutritionist/components/basic/text.dart';
import 'package:nutritionist/res/size/size.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../utils/spacer.dart';

class FeatureContent extends StatelessWidget {
  final Map<String, String> content;
  final double? height;
  final EdgeInsetsGeometry? padding;
  const FeatureContent({
    super.key,
    required this.content,
    this.padding,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color.primary.withOpacity(0.1)),
          color: color.background),
      clipBehavior: Clip.hardEdge,
      child: Container(
        padding: padding,
        height: height,
        color: color.primary.withOpacity(0.05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: isMobile ? 58 : 48,
                  width: isMobile ? 58 : 48,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: color.primary),
                  child: SvgPicture.asset(
                    svgIcon(content["icon"]!),
                    colorFilter:
                        ColorFilter.mode(color.background, BlendMode.srcIn),
                  ),
                ),
                const HorizontalSpace(10),
                Expanded(
                  child: SizedBox(
                    child: WebText(
                      content["title"]!,
                      fontSize: const SizePartner(18, 21),
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
            const VerticalSpace(20),
            WebText(
              content["subtitle"]!,
              textAlign: TextAlign.left,
              height: 1.5,
            )
          ],
        ),
      ),
    );
  }
}
