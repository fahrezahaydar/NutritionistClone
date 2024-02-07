import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutritionist/components/basic/logo.dart';
import 'package:nutritionist/components/basic/random.photo.dart';
import 'package:nutritionist/components/basic/text.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../utils/spacer.dart';

class TestimonialContent extends StatelessWidget {
  final List<Map<String, String>> data;
  final int index;

  const TestimonialContent(this.index, {super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    final isMobileTablet =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final is2K = ResponsiveBreakpoints.of(context).largerOrEqualTo("2K");
    return Container(
        decoration: BoxDecoration(
            color: color.primary.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                padding: EdgeInsets.all(isMobile ? 20 : 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      svgIcon('testi'),
                      colorFilter: ColorFilter.mode(
                        color.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    const VerticalSpace(40),
                    SizedBox(
                      height: isMobileTablet
                          ? null
                          : is2K
                              ? 100
                              : 120,
                      child: WebText(
                        data[index]["testimonial"]!,
                        maxLines: 5,
                      ),
                    ),
                  ],
                )),
            Container(
              color: color.primary.withOpacity(0.15),
              padding: const EdgeInsets.all(20),
              child: ListTile(
                leading: Photos.random(
                  size: isMobile ? 48 : 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                title: WebText.bold(
                  data[index]["name"]!,
                ),
              ),
            )
          ],
        ));
  }
}
